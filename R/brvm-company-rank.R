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
#'
#' @return
#' "tbl_df"     "tbl"        "data.frame"
#'
#' @importFrom rvest read_html html_elements html_table
#' @import dplyr
#' @examples
#' \donttest{
#' library(httr)
#' library(rvest)
#' BRVM_company_rank()
#' comp.rank <- BRVM_company_rank()
#' comp.rank<-comp.rank%>%
#' dplyr::arrange(desc(percent_change))
#' comp.rank
#'}
#'
#' @export


BRVM_company_rank <- function(){
  tryCatch(
    {
      quotes_tbl <- rvest::read_html("https://www.brvm.org/en/cours-actions/0") %>%
      # quotes_tbl <- rvest::read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>%
        rvest::html_elements('table') %>%
        rvest::html_table()

      quotes_tbl <- quotes_tbl[[4]]

      # quotes_tbl$`Change (%)`<-gsub(",", ".", quotes_tbl$`Change (%)`)
      # quotes_tbl$`Change (%)`<-as.numeric(quotes_tbl$`Change (%)`)
      # quotes_tbl$Volume<-gsub(" ", "", quotes_tbl$Volume)
      # quotes_tbl$Volume<-as.numeric(quotes_tbl$Volume)
      # quotes_tbl$`Previous price`<- gsub(" ", "", quotes_tbl$`Previous price`)
      # quotes_tbl$`Previous price`<- as.numeric(quotes_tbl$`Previous price`)
      # quotes_tbl$`Opening price`<- gsub(" ", "", quotes_tbl$`Opening price`)
      # quotes_tbl$`Opening price`<- as.numeric(quotes_tbl$`Opening price`)
      # quotes_tbl$`Closing price`<- gsub(" ", "", quotes_tbl$`Closing price`)
      # quotes_tbl$`Closing price`<- as.numeric(quotes_tbl$`Closing price`)

      # Mes colonnes numeriques
      numeric_columns <- c("Change (%)", "Volume", "Previous price", "Opening price", "Closing price")

      # Enlever les espaces vides
      quotes_tbl <- quotes_tbl %>%
          dplyr::mutate(across(numeric_columns, ~(gsub(" ", "", .))))

      quotes_tbl <- quotes_tbl %>%
          dplyr::mutate(across(all_of(numeric_columns), ~as.numeric(gsub(",", ".", .))))

      colnames(quotes_tbl)<-c(
        "ticker",
        "company_name",
        "volume",
        "previous_price",
        "open",
        "close",
        "percent_change")
      quotes_tbl$rank <- base::rank(-quotes_tbl$`percent_change`)

      # Use order() instead
      quotes_tbl <- quotes_tbl[base::order(-quotes_tbl$`percent_change`),]
      #quotes_tbl <-dplyr::arrange(quotes_tbl, dplyr::desc(quotes_tbl$`percent_change`))
      # quotes_tbl <- quotes_tbl[sort(quotes_tbl$rank), ]
      return(quotes_tbl[c(1,2,7,8)])
    },
    error = function(e) {
      message("Make sure you have an active internet connection")
    },
    warning = function(w) {
      message("Make sure you have an active internet connection")
    }
  )
}
