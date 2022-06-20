#' BRVM_rank - Get top or flop data of BRVM stock exchange 
#'
#' @param top_or_flop Choose between "top" or "flop"
#' @param n is the number of companies in the classification
#'
#' @return "tbl_df"     "tbl"        "data.frame"
#'
#' @description It receives "top" or "flop" and a number 'n' and
#' returns table of companies classification 
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @examples \dontrun{
#' BRVM_rank("top", 15)
#' BRVM_rank("flop", 5)}
#' @export

BRVM_rank <-function(top_or_flop, n=10){
  if (n > 46) {
    print("Please choose a number lower than or equal to 46")
    # return("Please choose a number lower than or equal to 46")
  } else if (stringr::str_to_title(top_or_flop) !="Top" && stringr::str_to_title(top_or_flop) !="Flop"){
    print("Please choose between Top and Flop")
    # return("Please choose between Top and Flop")
    
  } else {
    tryCatch(
      {
        # quotes.df = gsheet::gsheet2tbl(" https://docs.google.com/spreadsheets/d/1rdjGjlQg7cUzWAEJFikrxOnisk-yQQx-n652sJUL-qc/edit#gid=0 ")
        quotes.df <- rvest::read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>%
          rvest::html_nodes('table') %>%
          rvest::html_table()
        quotes.df <- quotes.df[[4]]    #[1:2]
        quotes.df <- tibble::as.tibble(quotes.df)
        quotes.df$`Change (%)`<-gsub(",", ".", quotes.df$`Change (%)`)
        quotes.df$`Change (%)`<-as.numeric(quotes.df$`Change (%)`)
        quotes.df <-quotes.df[-c(3:6)]
        names(quotes.df) <- c("Ticker", "Name", "Change (%)")
        
        # if (stringr::str_to_title(top_or_flop) %in% c("Top","Flop")){
          if (stringr::str_to_title(top_or_flop) == "Top"){
            quotes.df<-arrange(quotes.df, desc(quotes.df$`Change (%)`))
            assign(paste0("Top","_", n), quotes.df[1:n,])
            quotes.df <- tibble::as.tibble(quotes.df[1:n,])
            return(quotes.df)
            
          } else if (stringr::str_to_title(top_or_flop) == "Flop"){
            quotes.df$rank<-rank(quotes.df$`Change (%)`)
            quotes.df<- quotes.df[order(quotes.df$rank),]
            assign(paste0("Flop","_", n), quotes.df[-4][1:n,])
            quotes.df <- tibble::as.tibble(quotes.df[-4][1:n,])
            return(quotes.df)
          }   else {
            print("BRVM_rank('Top', 5) or BRVM_rank('Flop', 5)")
          }
          
          
        # } 
        
      },
      error = function(e) {
        print("Make sure you have an active internet connection")
      },
      warning = function(w) {
        print("Make sure you have an active internet connection")
      }
    )
  }
}
