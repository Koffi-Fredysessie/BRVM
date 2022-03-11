#' BRVM Rank
#'
#' @family Ranking
#' @family Data Retrieval
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
#' @param .up_or_down This is a character string set to "Up" It can either be
#' 'Up' or 'Down'.
#'
#' @examples
#' BRVM_direction("Up")
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_direction <- function(.up_or_down = "Up", .turn_off_warnings = TRUE) {

    # Set params ----
    up_down <- tolower(as.character(.up_or_down))
    turn_off_warnings <- as.logical(.turn_off_warnings)

    # Check params ----
    if (!is.character(up_down)){
        rlang::abort(
            message = "The '.up_or_down' parameters must be set to either up or down.",
            use_cli_format = TRUE
        )
    }

    if (!is.logical(turn_off_warnings)){
        rlang::warn(
            message = paste0("A non-boolean value was passed to '.turn_off_warnings',
                             it will be set to TRUE. The value passed is: ", turn_of_warnings),
            use_cli_format = TRUE
        )
        turn_off_warnings <- TRUE
    } else {
        turn_off_warnings <- turn_off_warnings
    }

    if (turn_off_warnings){
        options(warn = -1)
    }

    # get data ----
    quotes_tbl <- gsheet::gsheet2tbl(" https://docs.google.com/spreadsheets/d/1rdjGjlQg7cUzWAEJFikrxOnisk-yQQx-n652sJUL-qc/edit#gid=0 ")
    quotes_tbl$`Variation (%)` <- gsub(",", ".", quotes_tbl$`Variation (%)`)
    quotes_tbl$`Variation (%)` <- as.numeric(quotes_tbl$`Variation (%)`)
    quotes_tbl <- quotes_tbl[-c(3:6)]

    if (up_down == "up") {
        ret <- dplyr::arrange(quotes_tbl, dplyr::desc(quotes_tbl$`Variation (%)`)) %>%
            dplyr::slice(1:nrow(quotes_tbl))
        ret <- dplyr::as_tibble(ret)
    } else if (up_down == "down") {
        quotes_tbl$rank <- rank(quotes_tbl$`Variation (%)`)
        quotes_tbl <- quotes_tbl[order(quotes_tbl$rank), ]
        ret <- quotes_tbl %>%
            dplyr::slice(1:nrow(quotes_tbl)) %>%
            dplyr::select(-rank)
        ret <- dplyr::as_tibble(ret)
    }

    # Set clean names ----
    ret <- ret %>%
        purrr::set_names(
            "ticker",
            "company_name",
            "percentage_variation"
        )

    # Return data ----
    options(warn = 0)
    return(ret)

}
