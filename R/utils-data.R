#' Resultados da simulação
#'
#' Base com os resultados da simulação realizada para testar a efetividade do uso do oráculo.
#'
#' @format A data frame containing 130 rows and 6 variables:
#' \describe{
#'   \item{captcha}{nome do captcha testado}
#'   \item{n}{quantidade de observações utilizadas para construção do modelo inicial}
#'   \item{ntry}{quantidade de tentativas realizadas no oráculo}
#'   \item{fase}{qual modelo: inicial ou modelo baseado no oráculo}
#'   \item{model}{nome do arquivo do melhor modelo ajustado para cada combinação de captcha, n, ntry e fase}
#'   \item{acc}{acurácia do modelo}
#' }
"da_results_simulacao"
