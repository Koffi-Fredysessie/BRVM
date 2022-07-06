#' Brvm Company traded volume value - To know the traded volume value of each company
#'
#' @family Data Retrieval
#'
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#'
#' @description It receives one company listed on the BRVM stock exchange,
#' Turn to  upper case the input by using `toupper()`  and returns informations about the company's traded value
#'
#' @param company The name of company listed on the BRVM stock exchange
#'
#' @return "character"
#' @export
#'
#' @examples
#' \dontrun{
#' company_traded_val("ETIT")
#' company_traded_val("ontbf")
#' }
#'
company_traded_val <- function(company) {
  company <- toupper(company)
  tryCatch(
    {
      brvm_trade_all <- rvest::read_html("https://www.brvm.org/en/volumes/0/status/200") %>%
        rvest::html_nodes("table") %>%
        rvest::html_table()
      brvm_trade_all <- brvm_trade_all[[4]]
      for (elm in 1:nrow(brvm_trade_all)) {
        if (brvm_trade_all[elm, 1] == company) {
          trade_value <- paste0(brvm_trade_all[elm, 4], "")
        }
      }

      return(trade_value)
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
}
