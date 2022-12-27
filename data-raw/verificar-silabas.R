# código para verificar sílabas do documento PDF

texto <- pdftools::pdf_text("docs/Resolvendo-Captchas.pdf")

texto |>
  stringr::str_extract_all("[^ ,]{1,30}-\n +[^ ,]{1,30}") |>
  purrr::map(stringr::str_squish) |>
  purrr::map(stringr::str_remove_all, " ")
