#----------------------------------------------------------#
#
#
#                         L09
#
#              Prepare tree allometry data
#
#                OpenAI Codex and Ondřej Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Extract the source data from the package -----
#----------------------------------------------------------#

if (
  !requireNamespace(
    package = "lgrdata",
    quietly = TRUE
  )
) {
  cli::cli_abort(
    "Package {.pkg lgrdata} is required to prepare the teaching data."
  )
}

if (
  as.character(utils::packageVersion("lgrdata")) != "0.1.1"
) {
  cli::cli_abort(
    "Package {.pkg lgrdata} version 0.1.1 is required to reproduce the teaching data."
  )
}


#----------------------------------------------------------#
# Prepare the teaching table -----
#----------------------------------------------------------#

data(
  list = "allometry",
  package = "lgrdata"
)

data_allometry_source <- allometry

data_allometry_teaching <-
  data_allometry_source |>
  dplyr::transmute(
    druh_stromu = dplyr::recode_values(
      as.character(.data$species),
      from = c("PIMO", "PIPO", "PSME"),
      to = c(
        "Pinus monticola",
        "Pinus ponderosa",
        "Pseudotsuga menziesii"
      ),
      unmatched = "error"
    ),
    prumer_kmene_cm = .data$diameter,
    vyska_stromu_m = .data$height,
    plocha_listu_m2 = .data$leafarea,
    hmotnost_vetvi_kg = .data$branchmass
  )

if (
  nrow(data_allometry_teaching) != 63L ||
    anyNA(data_allometry_teaching)
) {
  cli::cli_abort(
    "The prepared allometry table failed its row or missing-value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_allometry_teaching,
  file = here::here(
    "data",
    "allometrie_stromu.csv"
  ),
  na = ""
)
