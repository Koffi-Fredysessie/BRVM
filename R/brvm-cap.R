#' BRVM Capitalization
#'
#' @description It receives no argument and returns informations about BRVM capitalization
#'
#' @family Data Retrieval
#' @family BRVM
#' @author Koffi Frederic SESSIE
#'
#' @seealso \url{https://www.brvm.org/en/capitalisations/0}
#'
#' @return
#' A tibble
#'
#' @export
#'
#' @importFrom rvest html_elements html_table read_html
#'
#' @importFrom tibble as.tibble
#'
#' @examples
#'
#' BRVM_cap()
#'
#'

BRVM_cap <- function(){
  # company<-toupper(company)
  tryCatch({
    brvm_cap <- rvest::read_html("https://www.brvm.org/en/capitalisations/0/status/200") %>%
      rvest::html_elements('table') %>%
      rvest::html_table()
    brvm_cap <- brvm_cap[[4]]
    brvm_cap$`Global capitalization (%)`<-gsub(",", ".",brvm_cap$`Global capitalization (%)`)
    # for (elm in 1:nrow(brvm_cap)){
    #   if (brvm_cap[elm,1]==company){
    #     the_cap<-paste0(brvm_cap[elm,6], "")
    #   }
    # }
    brvm_cap <- tibble::as.tibble(brvm_cap)
    return(brvm_cap)

  },
  error = function(e) {
    message("Make sure you have an active internet connection")
  },
  warning = function(w) {
    message("Make sure you have an active internet connection")
  })
}
