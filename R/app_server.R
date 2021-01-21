#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {

  shiny::observe({
    shinyalert::shinyalert(
      "Captchas",
      text = shiny::tagList(
        "Acesse os filtros no",
        shiny::strong("menu lateral"),
        " para especificar as an\u00e1lises.",
        "\n",
        "Se encontrar algum problema, envie um e-mail para",
        shiny::a(href = "mailto:jtrecenti@curso-r.com", "jtrecenti@curso-r.com"),
        "."
      ),
      closeOnClickOutside = TRUE,
      closeOnEsc = TRUE,
      showConfirmButton = FALSE,
      imageUrl = "https://d33wubrfki0l68.cloudfront.net/295643c6243701ae6a9bac3fb8ad467ff0ce3c84/d1785/img/logo/cursor1-41.png",
      html = TRUE,
      size = "m",
      imageWidth = 300
    )
  })


  app_data <- shiny::reactive({

    list(
      dados = datasets::mtcars
    )

  })

}

