#' BRVM PLOT
#'
#' @description This function will get Ticker(s) data and then plot it.
#'
#' @family Data Retrieval
#' @family Plot
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#'
#' @param .company is the Ticker(s) name(s)
#' @param .from A quoted start date, ie. "2020-01-01" or "2020/01/01". The date
#' must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
#' @param .to A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must
#' be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"
#' @param .up_color is the up color
#' @param .down_color is down color
#'
#' @seealso `BRVM_ticker_desc()`
#' @seealso `BRVM_tickers()`
#'
#' @return
#' An interactive chart
#'
#' @export
#'
#' @examples \dontrun{
#' BRVM_plot("BICC")
#' BRVM_plot("BICC", .up_color = "blue", .down_color = "pink")
#' BRVM_plot(c("BICC", "ETIT", "BOAM"))
#' }
BRVM_plot <- function(.company,
                      .from = Sys.Date() - 365,
                      .to = Sys.Date() - 1,
                      .up_color = "darkgreen",
                      .down_color = "red") {

  #  print('It possible to plot each sector chart line. You can use as argument .sectors$Agriculture to plot. Example BRVM_plot(.sector$Agriculture)')
  date1 <- as.Date(.from, format = "%Y-%m-%d")
  date2 <- as.Date(.to, format = "%Y-%m-%d")
  up_color <- tolower(as.character(.up_color))
  down_color <- tolower(as.character(.down_color))

  # Evaluate input parameters ----
  company <- unique(toupper(.company))

  Global.returns <- BRVM_get(.symbol = company, .from = date1, .to = date2)

  if (length(Global.returns) == 6) {
    ticker.name <- company
    Global.returns1 <- Global.returns
    Global.returns <- xts::as.xts(Global.returns[, -c(1)],
      order.by = Global.returns$Date
    )
    Global.returns1$direction <- NA
    for (i in 2:nrow(Global.returns1)) {
      i1 <- i - 1
      ifelse(Global.returns1[i, 6] >= Global.returns1[i1, 6],
        Global.returns1[i, "direction"] <- "up",
        Global.returns1[i, "direction"] <- "down"
      )
    }

    plt <- highcharter::highchart(type = "stock") %>%
      highcharter::hc_title(
        text = paste0(ticker.name, " chart : from ", date1, " to ", date2),
        style = list(fontWeight = "bold", fontSize = "25px"),
        align = "center"
      ) %>%
      highcharter::hc_add_series(
        name = "Prices",
        Global.returns,
        yAxis = 0,
        showInLegend = FALSE,
        upColor = up_color,
        color = down_color
      ) %>%
      highcharter::hc_add_yAxis(
        nid = 1L,
        relative = 1
      ) %>%
      highcharter::hc_add_series(
        name = "Volume",
        data = Global.returns1[, c(1, 6, 7)],
        yAxis = 1,
        showInLegend = FALSE,
        type = "column",
        highcharter::hcaes(
          x = Date,
          y = Volume,
          group = direction
        )
      ) %>%
      highcharter::hc_add_yAxis(
        nid = 2L,
        relative = 1
      ) %>%
      highcharter::hc_yAxis_multiples(
        list(title = list(
          style = list(
            color = "#333333",
            fontSize = "20px",
            fontFamily = "Erica One"
          ),
          text = "Price"
        ), top = "-10%", height = "90%", opposite = FALSE),
        list(title = list(
          style = list(
            color = "gray",
            fontSize = "20px",
            fontFamily = "Erica One"
          ),
          text = "Volume"
        ), top = "80%", height = "20%")
      ) %>%
      highcharter::hc_colors(colors = c(down_color, up_color)) %>%
      highcharter::hc_exporting(
        enabled = TRUE, # always enabled,
        filename = paste0(ticker.name, " chart : from ", date1, " to ", date2)
      )
  } else if (length(Global.returns) > 6) {
    plt <- highcharter::highchart(type = "stock") %>%
      highcharter::hc_add_series(
        data = Global.returns,
        type = "line",
        highcharter::hcaes(x = Date, y = Close, group = Ticker)
      ) %>%
      highcharter::hc_xAxis(title = list(text = "")) %>%
      highcharter::hc_title(text = paste0("Tickers line chart from ", date1, " to ", date2)) %>%
      highcharter::hc_exporting(
        enabled = TRUE, # always enabled,
        filename = paste0("Tickers line chart from ", date1, " to ", date2)
      )
  }

  # Return ----
  return(plt)
}
