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
#' @description This function will take in 'Up' or 'Down' and returns respectively n results for the top or flop ranking
#' of the BRVM tickers.
#'
#' @param .up_or_down This is a character string set to "Up" It can either be
#' 'Up' or 'Down'.
#'
#' @examples \dontrun{
#' BRVM_direction("Up")
#'}
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_direction <- function(.up_or_down = "Up") {

    # Set params ----
    up_down <- tolower(as.character(.up_or_down))

    # Check params ----
    if (!is.character(up_down)){
        rlang::abort(
            "The '.up_or_down' parameters must be set to either up or down."
        )
    } else {
        # get data ----
        quotes_tbl <- gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1rdjGjlQg7cUzWAEJFikrxOnisk-yQQx-n652sJUL-qc/edit#gid=0")

        names(quotes_tbl) <- c("Symbol", "Name", "Volume",
                               "Previous price  (FCFA)", "Opening price (FCFA)",
                               "Closing price  (FCFA)", "Change_percent")


        quotes_tbl$Change_percent <- gsub(",", ".", quotes_tbl$Change_percent)
        quotes_tbl$Change_percent <- as.numeric(quotes_tbl$Change_percent)
        quotes_tbl <- quotes_tbl[-c(3:6)]

        if (up_down == "up") {
            ret <- dplyr::arrange(quotes_tbl, dplyr::desc(quotes_tbl$Change_percent)) %>%
                dplyr::slice(1:nrow(quotes_tbl))
            ret <- dplyr::as_tibble(ret)
            names(ret) <- c("Symbole", "Nom", "Variation in percentage")
            # Return data ----

            return(ret)
        } else if (up_down == "down") {
            quotes_tbl$rank <- rank(quotes_tbl$Change_percent)
            quotes_tbl <- quotes_tbl[order(quotes_tbl$rank), ]
            ret <- quotes_tbl %>%
                dplyr::slice(1:nrow(quotes_tbl)) %>%
                dplyr::select(-rank)
            ret <- dplyr::as_tibble(ret)
            names(ret) <- c("Symbol", "Name", "Variation in percentage")
            # Return data ----

            return(ret)

        } else{
            print(paste0("'",up_down, "' is not correct! ","Choose 'Up' or 'Down' instead!"))
        }

    }
}
