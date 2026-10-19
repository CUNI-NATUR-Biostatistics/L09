#----------------------------------------------------------#
#
#
#                         L09
#
#      Render PollsLive evidence assets (retrieves L08)
#
#
#----------------------------------------------------------#

# The three evidence images reproduce familiar L08 displays from the approved
# L08 teaching data: the crab measurements (MASS::crabs as stored in
# L08/data/krabi.csv) and the felled trees (datasets::trees as stored in
# L08/data/stromy.csv). The source copies are verified by line-ending-
# independent SHA-256 hashes so that the check behaves the same on Windows
# and Linux checkouts. Harder replacement questions approved 2026-10-19.

here::i_am("R/render_pollslive_assets.R")

source_dir <-
  here::here("pollslive", "source")

output_dir <-
  here::here("pollslive", "assets")

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

#----------------------------------------------------------#
# 1. Verify the sources -----
#----------------------------------------------------------#

# krabi.csv: L08 revision 48a02706b17ef01d16ef84ec5d962e81710d2c4a
#   (unchanged up to bfb80b0); stromy.csv: L08 revision bfb80b0
expected_source_hashes <-
  c(
    "l08-krabi.csv" =
      "b88686865d6ef17e852495ee368a5d35919be6cefe20f0f6e308104ff68701de",
    "l08-stromy.csv" =
      "eb74a2ee1e2a567e7638fc3a4af03659af3e53443c3298b577d88c49c72e912e"
  )

for (
  source_file in names(expected_source_hashes)
) {
  text_source <-
    paste(
      readLines(
        file.path(source_dir, source_file),
        warn = FALSE,
        encoding = "UTF-8"
      ),
      collapse = "\n"
    )

  hash_source <-
    digest::digest(text_source, algo = "sha256", serialize = FALSE)

  if (
    !identical(hash_source, expected_source_hashes[[source_file]])
  ) {
    stop(
      "pollslive/source/", source_file, " does not match the pinned L08 ",
      "source (normalised SHA-256 ", hash_source, ")."
    )
  }
}

#----------------------------------------------------------#
# 2. Rebuild the L08 data and models -----
#----------------------------------------------------------#

data_krabi_zdroj <-
  utils::read.csv(
    file.path(source_dir, "l08-krabi.csv"),
    check.names = FALSE
  )

# Blue form only, as in the first L08 example; reference level samice
data_krabi <-
  data_krabi_zdroj[
    data_krabi_zdroj$sp == "B",
    c("sex", "CL", "RW")
  ]

names(data_krabi) <-
  c("pohlavi", "delka_krunyre_mm", "zadni_sirka_mm")

data_krabi$pohlavi <-
  factor(
    x = data_krabi$pohlavi,
    levels = c("F", "M"),
    labels = c("samice", "samec")
  )

mod_interakce <-
  stats::lm(
    formula = zadni_sirka_mm ~ delka_krunyre_mm * pohlavi,
    data = data_krabi
  )

# Both colour forms, as in the second L08 example; reference modrá samice
data_formy <-
  data.frame(
    forma = factor(
      x = data_krabi_zdroj$sp,
      levels = c("B", "O"),
      labels = c("modrá", "oranžová")
    ),
    pohlavi = factor(
      x = data_krabi_zdroj$sex,
      levels = c("F", "M"),
      labels = c("samice", "samec")
    ),
    delka_krunyre_mm = data_krabi_zdroj$CL
  )

mod_formy <-
  stats::lm(
    formula = delka_krunyre_mm ~ forma * pohlavi,
    data = data_formy
  )

# Felled trees, converted to metric units exactly as in L08
data_stromy_zdroj <-
  utils::read.csv(file.path(source_dir, "l08-stromy.csv"))

data_stromy <-
  data.frame(
    prumer_cm = data_stromy_zdroj$Girth * 2.54,
    vyska_m = data_stromy_zdroj$Height * 0.3048,
    objem_m3 = data_stromy_zdroj$Volume * 0.0283168
  )

mod_stromy <-
  stats::lm(
    formula = objem_m3 ~ prumer_cm * vyska_m,
    data = data_stromy
  )

stopifnot(
  nrow(data_krabi) == 100,
  nrow(data_formy) == 200,
  nrow(data_stromy) == 31,
  identical(
    names(stats::coef(mod_interakce)),
    c(
      "(Intercept)", "delka_krunyre_mm", "pohlavisamec",
      "delka_krunyre_mm:pohlavisamec"
    )
  ),
  identical(
    names(stats::coef(mod_formy))[4],
    "formaoranžová:pohlavisamec"
  ),
  identical(
    names(stats::coef(mod_stromy)),
    c("(Intercept)", "prumer_cm", "vyska_m", "prumer_cm:vyska_m")
  )
)

# Keyed answers of the approved questions, checked against the models
rozdil_pri_30 <-
  stats::coef(mod_interakce)[["pohlavisamec"]] +
  30 * stats::coef(mod_interakce)[["delka_krunyre_mm:pohlavisamec"]]

sklon_pri_35 <-
  stats::coef(mod_stromy)[["prumer_cm"]] +
  35 * stats::coef(mod_stromy)[["prumer_cm:vyska_m"]]

stopifnot(
  isTRUE(all.equal(round(rozdil_pri_30, 2), -1.76)),
  isTRUE(
    all.equal(
      round(stats::coef(mod_formy)[["formaoranžová:pohlavisamec"]], 2),
      -4.84
    )
  ),
  isTRUE(all.equal(round(sklon_pri_35, 3), 0.107)),
  max(data_stromy$vyska_m) < 35
)

#----------------------------------------------------------#
# 3. Shared styling (L08 colours for the sexes) -----
#----------------------------------------------------------#

# L08 reserves blue and orange for the two crab colour forms, so the sexes
#   use a colour-blind-safe green / reddish-purple pair, repeated by shape
#   (L08 author decision 2026-10-15).
vec_barvy <-
  c(samice = "#009E73", samec = "#CC79A7")

vec_symboly <-
  c(samice = 16, samec = 17)

cols <-
  c(
    parchment = "#F4F1EC",
    white = "#FFFFFF",
    indigo = "#5D2890",
    graphite = "#2E2E2E",
    grey = "#8A8A8A",
    orange = "#F3A712",
    pale = "#E9DFEF"
  )

theme_quiz <-
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = cols[["parchment"]],
      colour = NA
    ),
    panel.grid.minor = ggplot2::element_blank(),
    legend.position = "bottom",
    plot.title = ggplot2::element_text(
      colour = cols[["indigo"]],
      face = "bold",
      size = 26
    ),
    plot.subtitle = ggplot2::element_text(colour = cols[["graphite"]]),
    text = ggplot2::element_text(colour = cols[["graphite"]])
  )

theme_card <-
  theme_quiz +
  ggplot2::theme(
    axis.text = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank()
  )

# The quiz slide caps evidence at a fixed height, so wider-than-16:9 assets
#   are shown larger and stay readable when projected
save_quiz_plot <- function(plot, filename, height) {
  ggplot2::ggsave(
    filename = here::here(output_dir, filename),
    plot = plot,
    width = 10,
    height = height,
    dpi = 160,
    bg = cols[["parchment"]]
  )
}

# Czech decimal comma and a real minus sign for the printed estimates
format_card_value <- function(x, digits) {
  res_value <-
    formatC(
      x = x,
      format = "f",
      digits = digits,
      decimal.mark = ","
    )
  res_value <- sub("^-", "−", res_value)
  return(res_value)
}

# A neutral coefficient card: no row is highlighted, so the card does not
#   point to an answer
build_coefficient_card <- function(model, digits, units, title, subtitle) {
  vec_koeficienty <-
    stats::coef(model)

  data_karta <-
    data.frame(
      radek = rev(seq_along(vec_koeficienty)),
      nazev = names(vec_koeficienty),
      odhad = format_card_value(vec_koeficienty, digits = digits)
    )

  res_plot <-
    ggplot2::ggplot(data = data_karta) +
    ggplot2::geom_text(
      mapping = ggplot2::aes(x = 0.02, y = radek, label = nazev),
      hjust = 0,
      family = "mono",
      size = 8.5,
      colour = cols[["graphite"]]
    ) +
    ggplot2::geom_text(
      mapping = ggplot2::aes(x = 0.98, y = radek, label = odhad),
      hjust = 1,
      family = "mono",
      size = 8.5,
      colour = cols[["indigo"]],
      fontface = "bold"
    ) +
    ggplot2::annotate(
      geom = "text",
      x = c(0.02, 0.98),
      y = 5,
      label = c("Koeficient", units),
      hjust = c(0, 1),
      size = 7,
      colour = cols[["grey"]]
    ) +
    ggplot2::scale_x_continuous(limits = c(-0.03, 1.03)) +
    ggplot2::scale_y_continuous(limits = c(0.5, 5.4)) +
    ggplot2::labs(title = title, subtitle = subtitle) +
    theme_card

  return(res_plot)
}

#----------------------------------------------------------#
# 4. Q1: coefficient card of the crab interaction model -----
#----------------------------------------------------------#

graf_q1 <-
  build_coefficient_card(
    model = mod_interakce,
    digits = 4,
    units = "Odhad (mm, mm/mm)",
    title = "Koeficienty modelu s interakcí: modří krabi",
    subtitle = paste0(
      "zadni_sirka_mm ~ delka_krunyre_mm * pohlavi",
      " · referenční skupina: samice"
    )
  )

save_quiz_plot(graf_q1, "l08-koeficienty-interakce.png", height = 4.2)

#----------------------------------------------------------#
# 5. Q2: four group means of carapace length -----
#----------------------------------------------------------#

data_prumery <-
  stats::aggregate(
    delka_krunyre_mm ~ forma + pohlavi,
    data = data_formy,
    FUN = mean
  )

data_prumery$popisek <-
  paste(format_card_value(data_prumery$delka_krunyre_mm, digits = 2), "mm")

set.seed(900723)

graf_q2 <-
  ggplot2::ggplot(
    data = data_formy,
    mapping = ggplot2::aes(
      x = pohlavi,
      y = delka_krunyre_mm,
      colour = pohlavi,
      shape = pohlavi
    )
  ) +
  ggplot2::geom_jitter(width = 0.15, height = 0, alpha = 0.35, size = 1.8) +
  ggplot2::geom_line(
    data = data_prumery,
    mapping = ggplot2::aes(group = forma),
    colour = cols[["graphite"]],
    linewidth = 1.2
  ) +
  ggplot2::geom_point(
    data = data_prumery,
    mapping = ggplot2::aes(fill = pohlavi),
    shape = 23,
    size = 5,
    colour = cols[["white"]],
    stroke = 1.4
  ) +
  ggplot2::geom_label(
    data = data_prumery,
    mapping = ggplot2::aes(label = popisek),
    # Rows are ordered samice, samice, samec, samec: labels sit outside
    hjust = c(1, 1, 0, 0),
    nudge_x = c(-0.12, -0.12, 0.12, 0.12),
    size = 6,
    fill = cols[["white"]],
    colour = cols[["graphite"]],
    linewidth = 0
  ) +
  ggplot2::facet_wrap(
    facets = ggplot2::vars(forma),
    nrow = 1,
    labeller = ggplot2::as_labeller(
      c("modrá" = "modrá forma", "oranžová" = "oranžová forma")
    )
  ) +
  # Extra horizontal room so the printed means are not clipped at the edges
  ggplot2::scale_x_discrete(
    expand = ggplot2::expansion(add = c(1.1, 1.1))
  ) +
  ggplot2::scale_colour_manual(values = vec_barvy, guide = "none") +
  ggplot2::scale_fill_manual(values = vec_barvy, guide = "none") +
  ggplot2::scale_shape_manual(values = vec_symboly, guide = "none") +
  ggplot2::labs(
    title = "Průměrná délka krunýře ve čtyřech skupinách",
    subtitle = "50 krabů v každé skupině · kosočtverec = průměr skupiny",
    x = NULL,
    y = "Délka krunýře (mm)"
  ) +
  theme_quiz +
  ggplot2::theme(
    strip.text = ggplot2::element_text(size = 20, face = "bold")
  )

save_quiz_plot(graf_q2, "l08-ctyri-prumery.png", height = 4)

#----------------------------------------------------------#
# 6. Q3: coefficient card of the tree model with ranges -----
#----------------------------------------------------------#

vec_rozsah_prumeru <-
  format_card_value(range(data_stromy$prumer_cm), digits = 1)

vec_rozsah_vysek <-
  format_card_value(range(data_stromy$vyska_m), digits = 1)

graf_q3 <-
  build_coefficient_card(
    model = mod_stromy,
    digits = 5,
    units = "Odhad (m³, m³/cm, m³/m)",
    title = "Koeficienty modelu objemu dřeva",
    subtitle = paste0(
      "objem_m3 ~ prumer_cm * vyska_m · ",
      nrow(data_stromy), " stromů\n",
      "změřené průměry ", vec_rozsah_prumeru[1], "–",
      vec_rozsah_prumeru[2], " cm, výšky ", vec_rozsah_vysek[1], "–",
      vec_rozsah_vysek[2], " m"
    )
  )

save_quiz_plot(graf_q3, "l08-stromy-koeficienty.png", height = 4.4)

message("Rendered three L09 PollsLive evidence assets (retrieving L08).")
