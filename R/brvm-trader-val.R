#' BRVM traded value - To get the traded volume value data of all companies listed on BRVM stock exchange
#'
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#'
#' @description This function will get the traded volume value data of all companies listed on the BVRM exchange.
#' The function takes no parameter
#'
#' @return
#' A tibble
#' @export
#'
#' @examples
#'
#' BRVM_traded_val()
#'
#'

BRVM_traded_val <- function(){
  tryCatch({
    brvm_trade_all <- rvest::read_html("https://www.brvm.org/en/volumes/0/status/200") %>%
      rvest::html_nodes('table') %>%
      rvest::html_table()
    brvm_trade_all <- brvm_trade_all[[4]]
    brvm_trade_all$PER <- gsub(",", ".", brvm_trade_all$PER)
    brvm_trade_all$`Percent of global traded value` <- gsub(",", ".",brvm_trade_all$`Percent of global traded value`)
    return(brvm_trade_all)
  },
  error = function(e) {
    print("Make sure you have an active internet connection")
  },
  warning = function(w) {
    print("Make sure you have an active internet connection")
  })
}
