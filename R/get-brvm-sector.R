#' BRVM By Sector
#'
#' @family Sector
#' @family Data Retrieval
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @details This function will take in a vector of sectors provided by the end
#' user and return a tibble.
#'
#' @seealso \url{"https://www.richbourse.com/common/apprendre/liste-societes"}
#' @seealso \url{"https://www.richbourse.com/common/apprendre/liste-societes?page=2"}
#' @seealso \url{"https://www.richbourse.com/common/apprendre/liste-societes?page=3"}
#'
#' @description
#'
#' @param .sectors A vector of sectors you wish to have returned.
#' @param .turn_off_warnings A boolean value of TRUE or FALSE. Should global warnings
#' stay on or off. The default is off, after the function finishes running it will
#' turn global warnings back on.
#'
#' @examples
#'
#' sectors <- c(
#'   "Industry", "Administration", "PUblic service", "AUtr", "FINANCE",
#'   "distribution", 25
#' )
#' BRVM_sector(.sectors = sectors)
#' BRVM_sector(.sectors = "All")
#' BRVM_sector(.sectors = c("Other", "Agriculture"))
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_sector <- function(.sectors = "All", .turn_off_warnings = TRUE) {
  turn_off_warnings <- as.logical(.turn_off_warnings)

  if (!is.logical(turn_off_warnings)) {
    rlang::warn(
      message = paste0("A non-boolean value was passed to '.turn_off_warnings',
                             it will be set to TRUE. The value passed is: ", turn_of_warnings),
      use_cli_format = TRUE
    )
    turn_off_warnings <- TRUE
  } else {
    turn_off_warnings <- turn_off_warnings
  }

  if (turn_off_warnings) {
    options(warn = -1)
  }

  # Get sector list ----
  if (is.null(.sectors)) {
    rlang::abort(
      message = "The '.sectors' parameter cannot be blank. Please enter at
            least one sector. If entering specific multiple please use .sectors
            = c(Sector_1, Sector_2, ...). Or simply enter .symbol = c('All') to
            get all sectors information.",
      use_cli_format = TRUE
    )
  }

  # Get unique set of supplied sectors
  input_sector <- unique(stringr::str_to_title(.sectors))

  # Check input parameters ----
  if (length(input_sector) < 1) {
    rlang::abort(
      message = "The '.sectors' parameter cannot be blank. Please enter at
            least one sector. If entering specific multiple please use .sectors
            = c(Sector_1, Sector_2, ...). Or simply enter .symbol = c('All') to
            get all sectors information.",
      use_cli_format = TRUE
    )
  }

  # If user chooses 'All' then get all sectors from BRVM_available_sectors()
  available_sectors <- BRVM_available_sectors() %>%
    dplyr::pull(1) %>%
    as.vector()

  ifelse(
    input_sector == "All",
    input_sector <- available_sectors,
    input_sector
  )

  # Did a user choose a sector not in the list?
  bad_sector_choice <- input_sector[which(!input_sector %in% available_sectors)]
  good_sector_choice <- input_sector[which(input_sector %in% available_sectors)]

  if (length(bad_sector_choice) > 0) {
    rlang::warn(
      message = paste0(
        "You chose some sector(s) that are invalid. Those are: ",
        toString(bad_sector_choice), ". ",
        "Those will be dropped from your input."
      ),
      use_cli_format = TRUE
    )
  }

  if (length(good_sector_choice) > 0) {
    rlang::inform(
      message = paste0(
        "You chose valid sector(s). Those are: ",
        toString(good_sector_choice), ". ",
        "Those will be used from your input."
      ),
      use_cli_format = TRUE
    )
  } else {
    rlang::abort(
      message = paste0(
        "You did not chose any of the available sectors. You can choose from: ",
        toString(available_sectors)
      )
    )
  }

  # Scrape information about Ticker, their name and sector
  url_all <- c(
    "https://www.richbourse.com/common/apprendre/liste-societes",
    "https://www.richbourse.com/common/apprendre/liste-societes?page=2",
    "https://www.richbourse.com/common/apprendre/liste-societes?page=3"
  )

  tryCatch(
    {
      all_sector <- as.data.frame(matrix(NA, ncol = 3, nrow = 0))
      for (elem in url_all) {
        brvm_sect <- rvest::read_html(elem) %>%
          rvest::html_nodes("table") %>%
          rvest::html_table()
        all_sector <- rbind(all_sector, brvm_sect[[1]][-c(1, 5)])
      }
      names(all_sector) <- c("Company name", "Ticker", "Sector")
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )

  all_sector$Sector <- stringr::str_replace(all_sector$Sector, "Industrie", "Industry")
  all_sector$Sector <- stringr::str_replace(all_sector$Sector, "Finances", "Finance")
  all_sector$Sector <- stringr::str_replace(all_sector$Sector, "Autres", "Other")
  all_sector$Sector <- stringr::str_replace(all_sector$Sector, "Services publics", "Public service")

  all_sector <- all_sector %>%
    purrr::set_names("company_name", "ticker", "sector")

  #### Create a definitive sector vector
  sector_vec <- good_sector_choice

  ### Scrape daily quote data from BRVM exchange
  tryCatch(
    {
      brvm_all <- rvest::read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>%
        rvest::html_nodes("table") %>%
        rvest::html_table()
      brvm_all <- brvm_all[[4]]
      brvm_all$`Change (%)` <- gsub(",", ".", brvm_all$`Change (%)`)
      brvm_all$`Change (%)` <- as.numeric(brvm_all$`Change (%)`)
      brvm_all$Volume <- gsub(" ", "", brvm_all$Volume)
      brvm_all$Volume <- as.numeric(brvm_all$Volume)
      brvm_all$`Previous price` <- gsub(" ", "", brvm_all$`Previous price`)
      brvm_all$`Previous price` <- as.numeric(brvm_all$`Previous price`)
      brvm_all$`Opening price` <- gsub(" ", "", brvm_all$`Opening price`)
      brvm_all$`Opening price` <- as.numeric(brvm_all$`Opening price`)
      brvm_all$`Closing price` <- gsub(" ", "", brvm_all$`Closing price`)
      brvm_all$`Closing price` <- as.numeric(brvm_all$`Closing price`)
      colnames(brvm_all) <- c(
        "ticker",
        "company_name",
        "volume",
        "previous_price",
        "open",
        "close",
        "percent_change"
      )
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )


  ## Join both data by Ticker
  brvm_all <- dplyr::left_join(brvm_all, all_sector[-1], by = "ticker")

  brvm_all <- brvm_all %>%
    dplyr::filter(sector %in% sector_vec)

  # Return ----
  options(warn = 0)
  return(brvm_all)
}
