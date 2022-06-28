## code to prepare `da_results_simulacao` dataset goes here

## obtido do servidor (terranave)
# file.copy("/Users/julio/Downloads/da_results_simulacao.rds", "data-raw/")

da_results_simulacao <- readr::read_rds("data-raw/da_results_simulacao.rds")

usethis::use_data(da_results_simulacao, overwrite = TRUE)
