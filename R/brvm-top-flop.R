#' BRVM Rank
#'
#' @family Ranking
#' @family Ticker Data Retrieval
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @details This function will get any n results for the top or flop ranking
#' of the BRVM tickers.
#'
#' @description
#'
#' @param .top_or_flop This is a character string set to "Top". It can either
#' be "Top" or "Flop".
#' @param .n How many records to return
#'
#' @examples
#'
#' BRVM_rank("Top", 1)
#' BRVM_rank("blahblah", 1)
#' BRVM_rank("Flop", 1)
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_rank <- function(.top_or_flop = "Top", .n = 10) {

    # Set params ----
    top_flop <- tolower(as.character(.top_or_flop))
    n <- as.integer(.n)

    # Check params ----
    if (!is.character(top_flop)){
        rlang::abort(
            "The '.top_or_flop' parameters must be set to either top or flop."
        )
    }

    if (!is.numeric(n)){
        rlang::abort(
            "The '.n' parameter must be an numeric integer like 1 or 10."
        )
    }

    # get data ----
    quotes_tbl <- gsheet::gsheet2tbl(" https://docs.google.com/spreadsheets/d/1rdjGjlQg7cUzWAEJFikrxOnisk-yQQx-n652sJUL-qc/edit#gid=0 ")
    quotes_tbl$`Variation (%)` <- gsub(",", ".", quotes_tbl$`Variation (%)`)
    quotes_tbl$`Variation (%)` <- as.numeric(quotes_tbl$`Variation (%)`)
    quotes_tbl <- quotes_tbl[-c(3:6)]

    # Get nrow of quoats, if n > nrow(quotes_tbl) then error out ----
    if(nrow(quotes_tbl) < n){
        rlang::abort(
            "You have chosen more records than exist in the Quotes Tibble."
        )
    }

    if (top_flop == "top") {
        ret <- dplyr::arrange(quotes_tbl, dplyr::desc(quotes_tbl$`Variation (%)`)) %>%
            dplyr::slice(1:n)
        ret <- dplyr::as_tibble(ret)
        #assign(paste0("Top", "_", n), quotes_tbl[1:n, ])
    } else if (top_flop == "flop") {
        quotes_tbl$rank <- rank(quotes_tbl$`Variation (%)`)
        quotes_tbl <- quotes_tbl[order(quotes_tbl$rank), ]
        ret <- quotes_tbl %>%
            dplyr::slice(1:n) %>%
            dplyr::select(-rank)
        ret <- dplyr::as_tibble(ret)
        #assign(paste0("Flop", "_", n), quotes_tbl[-4][1:n, ])
    }

    # Return data ----
    return(ret)

}
