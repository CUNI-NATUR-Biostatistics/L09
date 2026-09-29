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
# Download the pinned source package -----
#----------------------------------------------------------#

url_lgrdata <-
  paste0(
    "https://cran.r-project.org/src/contrib/",
    "lgrdata_0.1.1.tar.gz"
  )

file_archive <-
  tempfile(fileext = ".tar.gz")

dir_archive <-
  tempfile(pattern = "lgrdata-")

dir.create(
  path = dir_archive,
  recursive = TRUE
)

download.file(
  url = url_lgrdata,
  destfile = file_archive,
  mode = "wb",
  quiet = FALSE
)

untar(
  tarfile = file_archive,
  exdir = dir_archive
)


#----------------------------------------------------------#
# Prepare the teaching table -----
#----------------------------------------------------------#

environment_data <-
  new.env(parent = emptyenv())

load(
  file = file.path(
    dir_archive,
    "lgrdata",
    "data",
    "allometry.rda"
  ),
  envir = environment_data
)

data_allometry_source <-
  get(
    x = "allometry",
    envir = environment_data
  )

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
