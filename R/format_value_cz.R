#----------------------------------------------------------#
#
#
#                         L09
#
#           Format computed values for Czech slides
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#' Format a computed value for Czech slide text or equations
#'
#' @param x Numeric vector to format.
#' @param digits Number of digits after the decimal mark.
#' @param signed Logical scalar. Show an explicit plus sign for positive values.
#' @param math Logical scalar. Format for a display equation. The sign and
#'   digits are wrapped together in `\text{}` so that neither the decimal
#'   comma nor the sign gets extra space in MathJax (HTML) or Typst (PDF);
#'   `{,}` becomes a thin space when pandoc converts it to Typst.
#'
#' @return A character vector containing consistently formatted values.
format_value_cz <- function(x, digits, signed = FALSE, math = FALSE) {
  vec_value <-
    formatC(
      x = x,
      format = "f",
      digits = digits,
      flag = if (signed) "+" else "",
      decimal.mark = "."
    )

  if (math) {
    vec_sign <-
      stringr::str_extract(
        string = vec_value,
        pattern = "^[+-]"
      )
    vec_sign[is.na(vec_sign)] <- ""
    vec_sign[vec_sign == "-"] <- "−"

    vec_digits <-
      vec_value |>
      stringr::str_remove(pattern = "^[+-]") |>
      stringr::str_replace_all(
        pattern = stringr::fixed("."),
        replacement = ","
      )

    vec_value <-
      paste0("\\text{", vec_sign, vec_digits, "}")
  } else {
    vec_value <-
      vec_value |>
      stringr::str_replace_all(
        pattern = stringr::fixed("."),
        replacement = ","
      ) |>
      stringr::str_replace(
        pattern = "^-",
        replacement = "−"
      )
  }

  return(vec_value)
}
