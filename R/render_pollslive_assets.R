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
# L08 teaching data (blue crabs, MASS::crabs as stored in L08/data/krabi.csv).
# The source copy is verified by a line-ending-independent SHA-256 so that the
# check behaves the same on Windows and Linux checkouts.

here::i_am("R/render_pollslive_assets.R")

source_path <-
  here::here("pollslive", "source", "l08-krabi.csv")

output_dir <-
  here::here("pollslive", "assets")

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

#----------------------------------------------------------#
# 1. Verify the source -----
#----------------------------------------------------------#

# L08 revision 48a02706b17ef01d16ef84ec5d962e81710d2c4a, data/krabi.csv
expected_source_hash <-
  "b88686865d6ef17e852495ee368a5d35919be6cefe20f0f6e308104ff68701de"

text_source <-
  paste(
    readLines(source_path, warn = FALSE, encoding = "UTF-8"),
    collapse = "\n"
  )

hash_source <-
  digest::digest(text_source, algo = "sha256", serialize = FALSE)

if (!identical(hash_source, expected_source_hash)) {
  stop(
    "pollslive/source/l08-krabi.csv does not match the pinned L08 source ",
    "(normalised SHA-256 ", hash_source, ")."
  )
}

#----------------------------------------------------------#
# 2. Rebuild the L08 models -----
#----------------------------------------------------------#

data_krabi_zdroj <-
  utils::read.csv(source_path, check.names = FALSE)

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

mod_rovnobezne <-
  stats::lm(
    formula = zadni_sirka_mm ~ delka_krunyre_mm + pohlavi,
    data = data_krabi
  )

mod_interakce <-
  stats::lm(
    formula = zadni_sirka_mm ~ delka_krunyre_mm * pohlavi,
    data = data_krabi
  )

stopifnot(
  nrow(data_krabi) == 100,
  identical(
    names(stats::coef(mod_interakce)),
    c(
      "(Intercept)", "delka_krunyre_mm", "pohlavisamec",
      "delka_krunyre_mm:pohlavisamec"
    )
  )
)

#----------------------------------------------------------#
# 3. Shared styling (L08 colours for the sexes) -----
#----------------------------------------------------------#

vec_barvy <-
  c(samice = "#9A3F87", samec = "#167B88")

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

save_quiz_plot <- function(plot, filename) {
  ggplot2::ggsave(
    filename = here::here(output_dir, filename),
    plot = plot,
    width = 10,
    height = 5.625,
    dpi = 160,
    bg = cols[["parchment"]]
  )
}

data_primky <-
  do.call(
    what = rbind,
    args = lapply(
      X = levels(data_krabi$pohlavi),
      FUN = function(skupina) {
        rozsah <-
          range(data_krabi$delka_krunyre_mm[data_krabi$pohlavi == skupina])
        data.frame(
          pohlavi = factor(skupina, levels = levels(data_krabi$pohlavi)),
          delka_krunyre_mm = seq(rozsah[1], rozsah[2], length.out = 100)
        )
      }
    )
  )

data_primky$odhad_rovnobezne <-
  stats::predict(object = mod_rovnobezne, newdata = data_primky)

data_primky$odhad_interakce <-
  stats::predict(object = mod_interakce, newdata = data_primky)

graf_body <-
  ggplot2::ggplot(
    data = data_krabi,
    mapping = ggplot2::aes(
      x = delka_krunyre_mm,
      y = zadni_sirka_mm,
      colour = pohlavi
    )
  ) +
  ggplot2::geom_point(alpha = 0.5, size = 2.2) +
  ggplot2::scale_colour_manual(values = vec_barvy) +
  ggplot2::labs(
    x = "Délka krunýře (mm)",
    y = "Zadní šířka krunýře (mm)",
    colour = "Pohlaví"
  ) +
  theme_quiz

#----------------------------------------------------------#
# 4. Q1: nonparallel fitted lines -----
#----------------------------------------------------------#

graf_q1 <-
  graf_body +
  ggplot2::geom_line(
    data = data_primky,
    mapping = ggplot2::aes(y = odhad_interakce),
    linewidth = 1.4
  ) +
  ggplot2::labs(
    title = "Modří krabi: model s interakcí",
    subtitle = "zadni_sirka_mm ~ delka_krunyre_mm * pohlavi"
  )

save_quiz_plot(graf_q1, "l08-nerovnobezne-primky.png")

#----------------------------------------------------------#
# 5. Q2: coefficient card -----
#----------------------------------------------------------#

vec_koeficienty <-
  stats::coef(mod_interakce)

data_karta <-
  data.frame(
    radek = rev(seq_along(vec_koeficienty)),
    nazev = names(vec_koeficienty),
    odhad = formatC(
      x = vec_koeficienty,
      format = "f",
      digits = 3,
      decimal.mark = ","
    ),
    zvyrazneni = names(vec_koeficienty) == "pohlavisamec"
  )

graf_q2 <-
  ggplot2::ggplot(data = data_karta) +
  ggplot2::geom_tile(
    data = data_karta[data_karta$zvyrazneni, ],
    mapping = ggplot2::aes(x = 0.5, y = radek),
    width = 1.02,
    height = 0.8,
    fill = cols[["orange"]],
    alpha = 0.25
  ) +
  ggplot2::geom_text(
    mapping = ggplot2::aes(x = 0.02, y = radek, label = nazev),
    hjust = 0,
    family = "mono",
    size = 9,
    colour = cols[["graphite"]]
  ) +
  ggplot2::geom_text(
    mapping = ggplot2::aes(x = 0.98, y = radek, label = odhad),
    hjust = 1,
    family = "mono",
    size = 9,
    colour = cols[["indigo"]],
    fontface = "bold"
  ) +
  ggplot2::annotate(
    geom = "text",
    x = c(0.02, 0.98),
    y = 5,
    label = c("Koeficient", "Odhad (mm, mm/mm)"),
    hjust = c(0, 1),
    size = 7,
    colour = cols[["grey"]]
  ) +
  ggplot2::scale_x_continuous(limits = c(-0.03, 1.03)) +
  ggplot2::scale_y_continuous(limits = c(0.5, 5.4)) +
  ggplot2::labs(
    title = "Koeficienty modelu s interakcí",
    subtitle = "zadni_sirka_mm ~ delka_krunyre_mm * pohlavi · referenční skupina: samice"
  ) +
  theme_quiz +
  ggplot2::theme(
    axis.text = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank()
  )

save_quiz_plot(graf_q2, "l08-koeficient-pohlavi.png")

#----------------------------------------------------------#
# 6. Q3: two candidate models -----
#----------------------------------------------------------#

data_kandidati <-
  rbind(
    data.frame(
      data_primky[, c("pohlavi", "delka_krunyre_mm")],
      odhad = data_primky$odhad_rovnobezne,
      model = "delka_krunyre_mm + pohlavi"
    ),
    data.frame(
      data_primky[, c("pohlavi", "delka_krunyre_mm")],
      odhad = data_primky$odhad_interakce,
      model = "delka_krunyre_mm * pohlavi"
    )
  )

data_kandidati$model <-
  factor(
    x = data_kandidati$model,
    levels = c("delka_krunyre_mm + pohlavi", "delka_krunyre_mm * pohlavi")
  )

graf_q3 <-
  graf_body +
  ggplot2::geom_line(
    data = data_kandidati,
    mapping = ggplot2::aes(y = odhad),
    linewidth = 1.3
  ) +
  ggplot2::facet_wrap(facets = ggplot2::vars(model), nrow = 1) +
  ggplot2::labs(
    title = "Dva kandidátní modely pro stejné kraby",
    subtitle = "odezva: zadni_sirka_mm · 100 modrých krabů"
  ) +
  ggplot2::theme(
    strip.text = ggplot2::element_text(
      family = "mono",
      size = 17,
      colour = cols[["indigo"]],
      face = "bold"
    )
  )

save_quiz_plot(graf_q3, "l08-dva-kandidati.png")

message("Rendered three L09 PollsLive evidence assets (retrieving L08).")
