#' BRVM companies capitalization value - To get the capitalization value data of all companies listed on BRVM stock exchange
#'
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#'
#' @description This function will get the capitalization value data of all companies listed on the BVRM exchange.
#' The function takes no parameter
#'
#' @return
#' A tibble
#' @export
#'
#' @importFrom rvest html_elements html_table read_html
#'
#' @examples
#'
#' BRVM_company_cap()
#'
#'
BRVM_company_cap <- function(){
  tryCatch({
    brvm_cap_all <- rvest::read_html("https://www.brvm.org/en/capitalisations/0/status/200") %>%
      rvest::html_elements('table') %>%
      rvest::html_table()
    brvm_cap_all <- brvm_cap_all[[4]]
    brvm_cap_all$`Global capitalization (%)`<-gsub(",", ".",brvm_cap_all$`Global capitalization (%)`)
    return(brvm_cap_all)

  },
  error = function(e) {
    message("Make sure you have an active internet connection")
  },
  warning = function(w) {
    message("Make sure you have an active internet connection")
  })
}
