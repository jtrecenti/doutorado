## code to prepare `da_results_simulacao` dataset goes here

## obtido do código do captchaOracle

da_online <- readr::read_rds("data-raw/da_online.rds")

usethis::use_data(da_online, overwrite = TRUE)
