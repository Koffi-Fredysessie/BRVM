#' BRVM ticker description - BRVM ticker information
#'
#' @family Data Retrieval
#' @family Richbourse
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @seealso \url{https://www.brvm.org/en/cours-actions/0}
#' 
#' @seealso `BRVM_tickers()`
#'
#' @details This function gives many informations about each ticker, his full name, sector and his country
#'
#' @description It receives no argument and returns informations about BRVM exchange companies.
#'
#' @examples BRVM_ticker_desc()
#'
#' @return A tibble
#'
#' @export
#'

BRVM_ticker_desc<- function(){
  tryCatch(
    {
      Desc.BRVM.all <- rvest::read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>%
        rvest::html_nodes('table') %>%
        rvest::html_table()
      Desc.BRVM.all <- Desc.BRVM.all[[4]]
      Desc.BRVM.all <- Desc.BRVM.all[1:2]
      colnames(Desc.BRVM.all)<-c(
        "Ticker",
        "Company name")
      
      #Create sector column
      Desc.BRVM.all$Sector<-NA
      for (elm in 1:length(Desc.BRVM.all$Ticker)){
        for (elm1 in 1 : length(.sectors)) {
          if (Desc.BRVM.all$Ticker[elm] %in% .sectors[[elm1]]) {     
            Desc.BRVM.all$Sector[elm]<- toupper(names(.sectors)[[elm1]])
          }
        }
      }
      
      #Create country column
      Desc.BRVM.all$Country<-NA
      for (elem in 1:length(Desc.BRVM.all$Ticker)){
        for (elem1 in 1 : length(Countries)) {
          if (Desc.BRVM.all$Ticker[elem] %in% Countries[[elem1]]) {     
            Desc.BRVM.all$Country[elem]<- names(Countries)[[elem1]]
          }
        }
      }
      Desc.BRVM.all$Country <- as.factor(Desc.BRVM.all$Country)
      Desc.BRVM.all$Sector <- as.factor(Desc.BRVM.all$Sector)
      
      return(Desc.BRVM.all)
      
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
  
}
