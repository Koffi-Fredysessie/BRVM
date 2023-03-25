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
#' @importFrom tibble as.tibble
#' @importFrom gsheet gsheet2tbl
#'
#' @export
#'
#' @examples \dontrun{
#' BRVM_tickers()
#' ticks <- BRVM_tickers()
#' dput(ticks$Ticker) ## Returns the name of all tickers
#' }

BRVM_tickers <- function(){
      all.tickers <- gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1RZ4uh4O8klBgo14eL-JyRL-UbbcAVkC_UY5Ouk4FNRE/edit#gid=581510196")
      # all.tickers <- xml2::read_html("https://www.brvm.org/en/cours-actions/0/") %>%
      #   rvest::html_elements('table') %>%
      #   rvest::html_table()
      # all.tickers <- all.tickers[[4]][1:2]
      all.tickers <- all.tickers[1:2]
      # print(all.tickers)
      all.tickers <- tibble::as.tibble(all.tickers)
      colnames(all.tickers)<-c(
        "Ticker",
        "Company name")
      return(all.tickers)
}
