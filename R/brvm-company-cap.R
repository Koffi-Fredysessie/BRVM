#' Company capitalization -  To know the capitalization of a given company
#'
#' @family Data Retrieval
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#' 
#' @description It receives one company listed on the BRVM stock exchange, 
#' Turn to  upper case your input by using `toupper()`  and returns informations about the company's capitalization
#' 
#' @param company The name of company listed on the BRVM stock exchange
#'
#' @return "character"
#' @export
#'
#' @examples
#' \dontrun{company_cap("BICC")
#' company_cap("ontbf")}
#' 
company_cap <- function(company){
  company<-toupper(company)
  tryCatch({
    brvm_cap_all <- rvest::read_html("https://www.brvm.org/en/capitalisations/0/status/200") %>%
      rvest::html_nodes('table') %>%
      rvest::html_table()
    brvm_cap_all <- brvm_cap_all[[4]]
    brvm_cap_all$`Global capitalization (%)`<-gsub(",", ".",brvm_cap_all$`Global capitalization (%)`)
    for (elm in 1:nrow(brvm_cap_all)){
      if (brvm_cap_all[elm,1]==company){
        the_cap<-paste0(brvm_cap_all[elm,6], "")
      }
    }
    
    return(the_cap)
    
  },
  error = function(e) {
    print("Make sure you have an active internet connection")
  },
  warning = function(w) {
    print("Make sure you have an active internet connection")
  })
}

