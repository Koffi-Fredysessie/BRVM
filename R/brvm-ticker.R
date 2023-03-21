#' BRVM Tickers - Information about listed companies on BRVM Stock exchange
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @description It receives no argument and returns two informations about BRVM exchange companies (ticker and company name).
#'
#' @seealso `BRVM_ticker_desc()`
#'
#' @return A tibble
#'
#' @export
#'
#' @examples \dontrun{BRVM_tickers()
#' ticks <- BRVM_tickers()
#' dput(ticks$Ticker) ## Returns the name of all tickers
#' }

BRVM_tickers <- function(){
  tryCatch(
    {
      all.tickers <- rvest::read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>%
        rvest::html_elements('table') %>%
        rvest::html_table()
      all.tickers <- all.tickers[[4]][1:2]
      all.tickers <- tibble::as.tibble(all.tickers)
      colnames(all.tickers)<-c(
        "Ticker",
        "Company name")
      return(all.tickers)
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )

}
