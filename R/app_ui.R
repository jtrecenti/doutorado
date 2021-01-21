#' The application User-Interface
#'
#' @import shiny
#' @noRd
app_ui <- function() {

  filtros <- purrr::imap(variaveis_cat(), ~{

    op <- as.character(sort(unique(datasets::mtcars[[.x]])))

    shinyWidgets::pickerInput(
      .x, .y,
      choices = op,
      selected = op,
      multiple = TRUE,
      options = shinyWidgets::pickerOptions(
        actionsBox = TRUE,
        container = "body",
        tickIcon = "fa fa-check",
        width = "100%",
        style = "btn-light text-dark",
        selectAllText = "Todos",
        deselectAllText = "Nenhum",
        selectedTextFormat = "count > 1",
        dropupAuto = FALSE
      )
    )
  })


  tagList(
    # Leave this function for adding external resources

    golem_add_external_resources(),

    bs4Dash::dashboardPage(

      # ----
      controlbar = bs4Dash::dashboardControlbar(
        skin = "light",
        filtros
      ),

      navbar = bs4Dash::dashboardHeader(
        rightUi = auth0::logoutButton(icon = icon("sign-out-alt"))
      ),

      # ----
      sidebar = bs4Dash::dashboardSidebar(
        skin = "light",
        title = "{decryptr}",
        bs4Dash::bs4SidebarMenu(
          bs4Dash::bs4SidebarMenuItem(
            "Classificacao",
            tabName = "classificacao",
            icon = "gavel"
          )
        )
      ),

      # ----
      body = bs4Dash::dashboardBody(
        fresh::use_theme(create_theme_css()),
        bs4Dash::bs4TabItems(
          bs4Dash::bs4TabItem(
            tabName = "classificacao"

          )
        )
      ),

      # ----
      footer = bs4Dash::dashboardFooter(
        copyrights = a(
          href = "https://curso-r.com",
          target = "_blank", "Curso-R"
        ),
        right_text = "2020 | desenvolvido com <3 pela Curso-R"
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){

  add_resource_path(
    'www', app_sys('app/www')
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'decryptr'
    ),
    shinyalert::useShinyalert()
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

