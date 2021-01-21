variaveis_cat <- function() {
  list(

  )
}

tempo_lab_one <- function(x) {
  ano <- floor(x)
  mes <- round((x %% 1) * 12)
  ano_s <- dplyr::if_else(ano > 1, "s", "")
  if (mes == 12) {
    ano <- ano + 1
    ano_s <- dplyr::if_else(ano > 1, "s", "")
    stringr::str_glue("{ano} ano{ano_s}")
  } else if (mes == 0) {
    stringr::str_glue("{ano} ano{ano_s}")
  } else {
    mes_es <- dplyr::if_else(mes > 1, "eses", "\u00eas")
    if (ano > 0) {
      stringr::str_glue("{ano} ano{ano_s} e {mes} m{mes_es}")
    } else {
      stringr::str_glue("{mes} m{mes_es}")
    }

  }
}

pct <- function(x) {
  scales::percent(x, 0.1, decimal.mark = ",")
}

#' Tempo em label
#'
#' @param x vetor de tempos em anos
#'
#' @export
tempo_lab <- function(x) {
  purrr::map_chr(x, tempo_lab_one)
}

barras <- function(da, tipo = "bar") {

  v <- names(da)[1]

  if (!tibble::has_name(da, "prop")) {
    da$prop <- with(da, n/sum(n))
  }

  da %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, fillColor = 1)
    ) %>%
    highcharter::hc_colors("#414487FF") %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    )
}

barras_empilhadas <- function(da, grupo, tipo = "column") {

  v <- names(da)[1]

  if (!tibble::has_name(da, "prop")) {
    da <- da %>%
      dplyr::group_by(!!rlang::sym(v)) %>%
      dplyr::mutate(prop = n/sum(n)) %>%
      dplyr::ungroup()
  }

  da %>%
    dplyr::mutate(lab = scales::percent(prop)) %>%
    highcharter::hchart(
      tipo,
      highcharter::hcaes(!!rlang::sym(v), n, group = !!rlang::sym(grupo)),
      stacking = "normal"
    ) %>%
    highcharter::hc_colors(c("#414487FF", "#2F6C8EFF", "#21908CFF", "#2FB47CFF", "#7AD151FF")) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = "<b>Quantidade</b>: {point.n}<br><b>Propor\u00e7\u00e3o</b>: {point.lab}"
    )
}

pizza <- function(da) {
  v <- names(da)[1]
  cores <- viridis::viridis(nrow(da), begin = .2, end = .8)
  da %>%
    highcharter::hchart(
      "pie",
      highcharter::hcaes(!!rlang::sym(v), prop)
    ) %>%
    highcharter::hc_tooltip(
      headerFormat = "",
      pointFormat = sprintf(
        "<b>{point.%s} <br> aparece em {point.lab} do total</b>",
        v
      )
    ) %>%
    highcharter::hc_colors(cores) %>%
    highcharter::hc_plotOptions(pie = list(
      allowPointSelect = TRUE,
      cursor = "pointer"
    ))

}

histograma <- function(v) {
  highcharter::hchart(v) %>%
    highcharter::hc_colors("#414487FF") %>%
    highcharter::hc_xAxis(plotLines = list(list(
      label = list(text = "Mediana"),
      color = "#FF0000",
      width = 2,
      value = stats::median(v),
      zIndex = 999
    )))
}

prop_agg <- function(x) {
  reactable::JS(stringr::str_glue("
      function(values, rows) {{
        var total = 0.0;
        var ntot = 0.0;
        rows.forEach(function(row) {{
          total += row['n'] * row['{x}'];
          ntot += row['n'];
        }})
        return total / ntot;
      }}
    "))
}
