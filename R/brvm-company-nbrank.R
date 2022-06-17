#' BRVM get company rank - Get a ticker rank according to brvm quote
#'
#' @family Data Retrieval
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @seealso \url{https://www.brvm.org/en/cours-actions/0}
#' @seealso `BRVM_company_rank()`
#'
#' @details This function will get the rank of one companies listed on the BVRM exchange through the Rich Bourse site. 
#' The function takes as parameter the name of company listed on BRVM
#'
#' @description This function returns the given company rank from the BRVM stock exchange according to their daily change (variation).
#' It uses `BRVM_company_rank()` to show all copanies rank before filtering the company we give as input
#'
#' @param .company The company name
#'
#' @return "character"
#' @export
#'
#' @examples
#' company_nbrank("BICC")
#' company_nbrank("SNTS")

company_nbrank<-function(.company){
  .company<-toupper(.company)
  tryCatch({
    companies_rk<-BRVM_company_rank()
    for (elm in 1:nrow(companies_rk)){
      if (companies_rk[[elm,1]]==.company){
        the_rank<- companies_rk[[elm,4]]
      }
    }
    if (the_rank!= 11& substr(the_rank, nchar(the_rank),nchar(the_rank)) == 1){
      the_rank<- paste0(the_rank, " st")
    } else if (the_rank!= 12 & substr(the_rank, nchar(the_rank),nchar(the_rank)) == 2){
      the_rank<- paste0(the_rank, " nd")
    } else if (the_rank!= 13 & substr(the_rank, nchar(the_rank),nchar(the_rank)) == 3){
      the_rank<- paste0(the_rank, " rd")
    } else { 
      the_rank<- paste0(the_rank, " th")
    }
    the_rank<-paste0(.company," is the ", the_rank)
    
    
    return(the_rank)
    
  },
  error = function(e) {
    print("Make sure you have an active internet connection")
  },
  warning = function(w) {
    print("Make sure you have an active internet connection")
  })
  
  
}
