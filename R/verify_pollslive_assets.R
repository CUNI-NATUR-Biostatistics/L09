#----------------------------------------------------------#
# Verify approved local evidence for the L09 retrieval quiz
#----------------------------------------------------------#

library(here)

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l08-nerovnobezne-primky.png" =
      "c5ee7001714a10c48d6f19c662bf69ef27133467ddae6dc3ad686b63dbcc6e48",
    "l08-koeficient-pohlavi.png" =
      "099989aac50dbe9d9865c26938c3db6e01bc23e96f12925c535cab72b5cb3939",
    "l08-dva-kandidati.png" =
      "e56490d44ce5d555ea8f6fa6ce21f953711ee9846990012af32066d5d376d22a"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (length(missing_assets) > 0L) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    paste(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  unname(
    vapply(
      asset_paths,
      digest::digest,
      character(1),
      algo = "sha256",
      file = TRUE
    )
  )

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (length(changed_assets) > 0L) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    paste(changed_assets, collapse = ", ")
  )
}
