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
      "bc781ebba6889736c8e90f1bb6ce125d6bece1a81f52099d6245d17e527b2126",
    "l08-koeficient-pohlavi.png" =
      "099989aac50dbe9d9865c26938c3db6e01bc23e96f12925c535cab72b5cb3939",
    "l08-dva-kandidati.png" =
      "1e3771348ca639ebb7b0e77fbbc0ba5d9501a03cca7f86e039c21bbdc0beff64"
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
