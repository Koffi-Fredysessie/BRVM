#' BRVM Get - Get Ticker Data
#'
#' @family Data Retrieval
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @seealso \url{https://www.brvm.org/en/indices/status/200}
#'
#' @details This function will get index data from \url{www.brvm.org}
#'
#' @description This function will get data from \url{www.brvm.org}.
#'
#' @examples
#' BRVM_index()
#' @return
#' A tibble
#'
#' @export
#'

BRVM_index <- function(.turn_off_warnings = TRUE) {

    turn_off_warnings <- as.logical(.turn_off_warnings)

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

  tryCatch(
    {
      index <- rvest::read_html("https://www.brvm.org/en/indices/status/200") %>%
        rvest::html_nodes("table") %>%
        rvest::html_table()

      index <- index[[4]][-6]
      index$`Previous closing` <- gsub(" ", "", index$`Previous closing`)
      index$`Previous closing` <- gsub(",", ".", index$`Previous closing`)
      index$`Previous closing` <- as.numeric(index$`Previous closing`)
      index$Closing <- gsub(" ", "", index$Closing)
      index$Closing <- gsub(",", ".", index$Closing)
      index$Closing <- as.numeric(index$Closing)
      index$`Change (%)` <- gsub(",", ".", index$`Change (%)`)
      index$`Change (%)` <- as.numeric(index$`Change (%)`)
      index$`Year to Date Change` <- gsub(",", ".", index$`Year to Date Change`)
      index$`Year to Date Change` <- as.numeric(index$`Year to Date Change`)
      names(index) <- c(
        "Indexes",
        "Previous closing",
        "Closing",
        "Change (%)",
        "Year to Date Change"
      )
      index$Indexes <- stringr::str_replace(index$Indexes, "BRVM - INDUSTRIE", "BRVM - INDUSTRY")
      index$Indexes <- stringr::str_replace(index$Indexes, "BRVM - AUTRES SECTEURS", "BRVM - OTHER SECTOR")
      index$Indexes <- stringr::str_replace(index$Indexes, "SERVICES PUBLICS", "PUBLIC SERVICE")
      index$Indexes <- stringr::str_replace(index$Indexes, "BRVM-10", "BRVM - 10")
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )

  # Clean names of tibble ----
  index <- index %>%
    purrr::set_names(
      "index_name", "previous_close", "close", "percent_change",
      "percent_ytd_change"
    )

  # Return ----
  options(warn = 0)
  return(index)
}
