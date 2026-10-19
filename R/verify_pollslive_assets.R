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
    "l08-koeficienty-interakce.png" =
      "dc0b3b1d33b1139ed9b24175ddd5e47b17972c7b65a214db397e1e7c739154c1",
    "l08-ctyri-prumery.png" =
      "9868f88ed65b55a06e060e7deff795b20eb24bca3bb1930f12b5d2ea57744656",
    "l08-stromy-koeficienty.png" =
      "650eacea1c0f352e31823c225bd6e18cca940514986897baf53fd284bdced75c"
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
