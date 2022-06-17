#' BRVM Companies Rank - Get all tickers rank according to last quotation
#'
#' @family Data Retrieval
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @seealso \url{https://www.brvm.org/en/cours-actions/0}
#'
#' @details This function will get the rank of the companies listed on the BVRM exchange through the Rich Bourse site. 
#' The function takes no parameter
#'
#' @description This function returns companies rank from the BRVM Bourse exchange according to their daily change (variation).
#'
#' @examples
#' BRVM_company_rank()
#' comp.rank<-BRVM_company_rank()
#' comp.rank%>%arrange(desc(percent_change))
#'
#' @return
#' "tbl_df"     "tbl"        "data.frame"
#'
#' @export
#'
BRVM_company_rank <- function(){
  tryCatch(
    {
      quotes_tbl <- rvest::read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>%
        rvest::html_nodes('table') %>%
        rvest::html_table()
      quotes_tbl <- quotes_tbl[[4]]
      quotes_tbl$`Change (%)`<-gsub(",", ".", quotes_tbl$`Change (%)`)
      quotes_tbl$`Change (%)`<-as.numeric(quotes_tbl$`Change (%)`)
      quotes_tbl$Volume<-gsub(" ", "", quotes_tbl$Volume)
      quotes_tbl$Volume<-as.numeric(quotes_tbl$Volume)
      quotes_tbl$`Previous price`<-gsub(" ", "", quotes_tbl$`Previous price`)
      quotes_tbl$`Previous price`<-as.numeric(quotes_tbl$`Previous price`)
      quotes_tbl$`Opening price`<-gsub(" ", "", quotes_tbl$`Opening price`)
      quotes_tbl$`Opening price`<-as.numeric(quotes_tbl$`Opening price`)
      quotes_tbl$`Closing price`<-gsub(" ", "", quotes_tbl$`Closing price`)
      quotes_tbl$`Closing price`<-as.numeric(quotes_tbl$`Closing price`)
      colnames(quotes_tbl)<-c(
        "ticker",
        "company_name",
        "volume",
        "previous_price",
        "open",
        "close",
        "percent_change")
      quotes_tbl$rank <- rank(-quotes_tbl$`percent_change`)
      quotes_tbl <-dplyr::arrange(quotes_tbl, dplyr::desc(quotes_tbl$`percent_change`))
      #      quotes_tbl <- quotes_tbl[sort(quotes_tbl$rank), ]
      return(quotes_tbl[c(1,2,7,8)])
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
}
