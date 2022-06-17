#' BRVM Get info about a ticker beta, RSI, Closing, Valorisation, etc.  
#'
#' @author Koffi Frederic SESSIE
#'
#' @description It receives the ticker of a company listed on the BRVM stock exchange, 
#' Turn to  upper case the input by using `toupper()` and returns informations about the company's RSI, Beta, Closing price, etc. .
#'
#' @seealso \url{https://www.sikafinance.com}
#' 
#' @param ticker The ticker of a company
#'
#' @return A tibble
#' @export
#'
#' @examples
#' BRVM_company_info("BOAS")
#' BRVM_company_info("BoaM")
#' 
BRVM_company_info<- function(ticker){
  ticker<-toupper(ticker)
  
  if (ticker %in% .indexes){
    url<-paste0("https://www.sikafinance.com/marches/cotation_", ticker)
  }
    
  
  else if (company_country(ticker) %in% names(Countries)){
    if (company_country(ticker) == "BENIN") {
      adn<- ".bj"
    } else if (company_country(ticker) == "BURKINA FASO") {
      adn<- ".bf"
    } else if (company_country(ticker) == "IVORY COAST") {
      adn<- ".ci"
    } else if (company_country(ticker) == "MALI") {
      adn<- ".ml"
    } else if (company_country(ticker) == "NIGER") {
      adn<- ".ne"
    } else if (company_country(ticker) == "SENEGAL") {
      adn<- ".sn"
    } else if (company_country(ticker) == "TOGO") {
      adn<- ".tg"
    } 
    url<-paste0("https://www.sikafinance.com/marches/cotation_", ticker, adn)
  }
  
  
  ##Create empty dataframe
  ticker_info<-as.data.frame(matrix(NA, ncol = 2, nrow = 0))
  tryCatch({
    for (i in 2:4){
      val<- (read_html(url) %>% html_nodes('table') %>% html_table())[[i]]
      ticker_info<-rbind(ticker_info, val)  
    }
    colnames(ticker_info)<- NULL
    return(ticker_info)
  },
  error = function(e) {
    print("Make sure you have an active internet connection")
  },
  warning = function(w) {
    print("Make sure you have an active internet connection")
  })
}
