# CUNI-NATUR-Biostatistics L09 — colour emoji in figures, 2026.
# Use ragg with the brand fonts -----
# showtext draws text as paths and cannot render colour emoji, so the
#   variable icons on figure axes appeared as empty or monochrome glyphs.
#   This switches knitr figures to the ragg device and registers the brand
#   Google fonts with systemfonts under the family names that theme_biostat()
#   uses. Call after sourcing R/set_r_theme.R.
use_ragg_brand_fonts <- function() {
  showtext::showtext_auto(enable = FALSE)

  systemfonts::get_from_google_fonts("Inter")
  systemfonts::get_from_google_fonts("Source Sans 3")

  systemfonts::register_variant(
    name = biostat_base_font,
    family = "Inter"
  )
  systemfonts::register_variant(
    name = biostat_heading_font,
    family = "Source Sans 3",
    weight = "bold"
  )

  knitr::opts_chunk$set(dev = "ragg_png")

  return(invisible(TRUE))
}
