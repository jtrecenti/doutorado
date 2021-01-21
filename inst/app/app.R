readRenviron(".Renviron")
# shiny::shinyApp(doutorado:::app_ui(), doutorado:::app_server)
auth0::shinyAppAuth0(doutorado:::app_ui(), doutorado:::app_server)
