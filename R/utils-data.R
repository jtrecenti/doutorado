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

#' Lista de captchas
#'
#' Base com as informações da base
#'
#' @format A data frame containing 10 rows and 5 columns
#'
#' \describe{
#'   \item{site}{Site do captcha}
#'   \item{exemplo}{Exemplo de captcha}
#'   \item{descricao}{Descrição do Captcha}
#'   \item{chutes}{Aceita múltiplos chutes}
#'   \item{n}{Quandidade de casos classificados}
#' }
"da_captchas"
