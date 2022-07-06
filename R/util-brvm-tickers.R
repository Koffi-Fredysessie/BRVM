#' BRVM Available Tickers
#'
#' @family Utility
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @details This function will return a vector tibble of available Tickers.
#'
#' @seealso \url{"https://www.brvm.org/en/cours-actions/"}
#'
#' @description Returns a tibble of available Tickers for BRVM.
#'
#' @examples
#'
#' BRVM_available_tickers()
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_available_tickers <- function() {
  tickers <- rvest::read_html("https://www.brvm.org/en/cours-actions/0") %>%
    rvest::html_nodes("table") %>%
    rvest::html_table()

  tickers <- tickers[[4]][1:2] %>%
    purrr::set_names("ticker", "company_name")

  return(tickers)
}
