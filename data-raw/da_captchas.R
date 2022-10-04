googlesheets4::gs4_auth("julio.trecenti@gmail.com")
da_captchas_raw <- googlesheets4::read_sheet("12sbpVBwMQV1U2H0F61j-1o7Ey4y8jYF2uuir4Yqcxg8")
da_captchas <- da_captchas_raw |>
  dplyr::filter(!fonte %in% c("mnist", "rcaptcha"), bases_teste) |>
  dplyr::transmute(
    site = glue::glue("[{fonte}]({link_site})"),
    exemplo = glue::glue("![exemplo de Captcha da lista apresentada.](assets/img/dados_{fonte}.{ext})"),
    descricao,
    chutes = dplyr::if_else(aceita_varios_chutes, "Sim", "Não"),
    n_total,
    caracteres,
    comprimento,
    colorido
  )

usethis::use_data(da_captchas, overwrite = TRUE)

## arruma as imagens para colocar na tabela
# fs::dir_ls("assets/img/", regexp = "dados_") |>
#   purrr::walk(\(.x) {
#     .x |> magick::image_read() |>
#       magick::image_resize("100x") |>
#       magick::image_extent("100x50", color = "white") |>
#       magick::image_write(.x)
#   })
