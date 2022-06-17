#' BRVM MARKET ACTIVITIES
#'
#' @description It receives no argument and returns informations about BRVM market activities 
#'
#' @family Data Retrieval
#' @family BRVM
#' 
#' @author Koffi Frederic SESSIE
#' 
#' @seealso \url{https://www.brvm.org/en/summary}
#' 
#' @return A tibble
#' 
#' @export
#'
#' @examples
#' BRVM_market_activity()
#' 
BRVM_market_activity <- function(){
  tryCatch(
    {
      market_activity <- rvest::read_html("https://www.brvm.org/en/summary") %>%
        rvest::html_nodes('table') %>%
        rvest::html_table()
      market_activity <- market_activity[[1]][,1:3]
      # market_activity <- tibble::as.tibble(market_activity)
      # colnames(market_activity)<-c(
      #   "Ticker",
      #   "Company name")
      market_activity[[4,2]] <-gsub(",", ".", market_activity[[4,2]])
      market_activity[[4,3]] <-gsub(",", ".", market_activity[[4,3]])
      market_activity[[5,2]] <-gsub(",", ".", market_activity[[5,2]])
      market_activity[[5,3]] <-gsub(",", ".", market_activity[[5,3]])
      return(market_activity)
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
  
}
