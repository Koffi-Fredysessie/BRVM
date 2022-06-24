#' BRVM Get - Get Ticker Data
#'
#' @family Data Retrieval
#' @family Richbourse
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @seealso \url{https://www.richbourse.com}
#'
#' @details This function will get data of the companies listed on the BVRM exchange through the Rich Bourse site. The function
#' takes in a single parameter of `.symbol` The function will auto-format the
#' tickers you input into all upper case by using `toupper()` The function will
#' next make sure that the ticker passed is inside of a google spreadsheet of
#' allowed tickers.
#'
#' @description This function will get data from the Rich Bourse exchange.
#'
#' @param .symbol A vector of symbols, like: c("BICC","XOM","SlbC")
#' @param .from A quoted start date, ie. "2020-01-01" or "2020/01/01". The data
#' must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
#' @param .to A quoted end date, ie. "2022-01-31" or "2022/01/31". The data must
#' be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"
#'
#' @examples
#' symbols <- c("BiCc","XOM","SlbC")
#' data_tbl <- BRVM_get(.symbol = symbols, .from = Sys.Date() - 10)
#' data_tbl
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_get <- function(.symbol, .from = Sys.Date() - 365, .to = Sys.Date() - 1) {
  # Evaluate input parameters ----
  tickers <- unique(toupper(.symbol))
  Symbole <- c( "ABJC", "BICC", "BNBC", "BOAB", "BOABF", "BOAC", "BOAM", "BOAN", "BOAS", "CABC", "CBIBF", "CFAC", "CIEC", "ECOC", "ETIT", "FTSC", "NEIC", "NSBC", "NTLC", "ONTBF", "ORGT", "PALC", "PRSC", "SAFC", "SCRC", "SDCC", "SDSC", "SEMC", "SGBC", "SHEC", "SIBC", "SICC", "SIVC", "SLBC", "SMBC", "SNTS", "SOGC", "SPHC", "STAC", "STBC", "SVOC", "TTLC", "TTLS", "UNLC", "UNXC"
                #, "TTRC"
  )
  ifelse(tickers=="ALL",
         tickers<-Symbole,
         tickers)
  start_date <-  lubridate::parse_date_time(.from, orders = "ymd")
  end_date <- lubridate::parse_date_time(.to, orders = "ymd")
  # Check input parameters ----
  if (length(tickers) < 1){
    rlang::abort(
      "The '.symbol' parameter cannot be blank. Please enter at least one ticker.
            If entering multiple please use .symbol = c(Tick_1, Tick_2, ...)"
    )
  }

  if (start_date > end_date){
    rlang::abort(
      "The '.from' parameter (start_date) must be equal to or less than .to (end_date)"
    )
  }

  returns <- as.data.frame(matrix(NA, ncol = 7, nrow = 0))
  names(returns) <- c("Date", "Open", "High", "Low", "Close", "Volume", "Ticker")

  #### Create a definitive symbol vector
  symbol_vec <- NULL
  ## Filter symbol in quote symbol list
  for (symb in tickers) {
    if (symb %in% Symbole) {
      symbol_vec <- c(symbol_vec, symb)
    }
  }
  # Check input parameters after filtering ----
  if (length(symbol_vec) < 1){
    rlang::abort(
      "The '.symbol' parameter cannot be blank. Please enter at least one ticker.
            If entering multiple please use .symbol = c(Tick_1, Tick_2, ...)"
    )
  }
  tryCatch(
    {
      for (Tick in symbol_vec) {
        url <- paste0("https://www.richbourse.com/common/mouvements/technique/", Tick, "/status/200")
        Sys.sleep(1)
        page <- httr::GET(url)
        page <- httr::content(page, as = "text", encoding = "UTF-8")
        page <- unlist(strsplit(page, split = "\n"))
        vect.data<- NULL

        for (i in 600:650){
          if (length(unlist(strsplit(page[[i]], split = ":")))==2) {
            if ((unlist(strsplit(page[[i]], split = ":")))[[1]] == "                data") {
              vect.data<- c(vect.data, i)
            }

          }

        }
        # vect.data[1]   #is the historical data
        # vect.data[2]  # is the volume data
        if (length(vect.data) < 2) {
          vect.data<- NULL
          for (i in 550:700){
            if (length(unlist(strsplit(page[[i]], split = ":")))==2) {
              if ((unlist(strsplit(page[[i]], split = ":")))[[1]] == "                data") {
                vect.data<- c(vect.data, i)
              }

            }

          }
        }

        data1 <- unlist(strsplit(page[[vect.data[1]]], split = ":"))
        data1 <- data1[2] # Show table 1 ##First 5 columns (Date, Open, High, Low, Close)
        data1 <- gsub(" ", "", data1)
        data1 <- strsplit(data1, split = "],")
        data1 <- as.data.frame(data1)

        for (i in 1:nrow(data1)) {
          data1[i, 1] <- gsub("\\[|\\]", "", data1[i, 1])
        }
        ### Now transform one column to 5 columns

        ## And change numbers in integer
        colnames(data1) <- c("unique")
        data1 <- tidyr::separate(data1, col = unique, into = c("Date", "Open", "High", "Low", "Close"), sep = ",")
        data1$Open <- as.numeric(data1$Open)
        data1$High <- as.numeric(data1$High)
        data1$Low <- as.numeric(data1$Low)
        data1$Close <- as.numeric(data1$Close)
        # Transform date from character to numeric
        data1$Date <- as.numeric(data1$Date)
        ## Turn date in format "%Y-%m-%d"
        #data1$Date <- as.Date(as.POSIXct((data1$Date + 0.1) / 1000, origin = "1970-01-01"))
        data1$Date <- as.Date.POSIXct((data1$Date + 0.1) / 1000)

        ## Volume data Case (2 columns : Date and Volume)
        data2 <- unlist(strsplit(page[[vect.data[2]]], split = ":"))
        data2 <- data2[[2]]
        # Data Cleaning
        data2 <- gsub(" ", "", data2) # Volume
        ### Remove all second square bracket closer to a comma
        data2 <- strsplit(data2, split = "],") # Volume
        data2 <- as.data.frame(data2) # Volume
        ### Use a loop to remove the remaining square brackets in each row
        #j <- 1
        Date=NULL
        Volume=NULL
        for (j in 1:nrow(data2)) {
          data2[j, 1] <- gsub("\\[|\\]", "", data2[j, 1])
          Date <- c(Date,unlist(strsplit(data2[j, 1],split = ','))[1])
          Volume <- c(Volume,unlist(strsplit(data2[j, 1],split = ','))[[2]])
        }

        #Sys.sleep(1)
        Volume <- as.numeric(Volume)
        Date <- as.Date.POSIXct((as.numeric(Date) + 0.1) / 1000)
        data2 <- data.frame(Date,Volume)
        ## Turn date in format "%Y-%m-%d"
        #data2$Date <- as.Date(as.POSIXct((data2$Date + 0.1) / 1000, origin = "1970-01-01"))
        ## Join data by date
        final.data <- merge(data1, data2, by = "Date")
        ifelse (any(duplicated(final.data$Date)),
                final.data<-final.data%>%
                  dplyr::group_by(Date)%>%
                  summarise(Open=ceiling(mean(Open)),
                            High= ceiling(mean(High)),
                            Low= ceiling(mean(Low)),
                            Close= ceiling(mean(Close)),
                            Volume= ceiling(mean(Volume))),
                final.data)
        assign(Tick, dplyr::as_tibble(final.data),envir = globalenv())
        final.data$Ticker <- Tick ## Add ticker identifier
        returns <- rbind(returns, final.data)
      }
      returns <- dplyr::as_tibble(returns) %>%
        dplyr::filter(Date >= start_date) %>%
        dplyr::filter(Date <= end_date)

      if (length(unique(returns$Ticker)) > 1) {
        returns <- returns
      } else {
        returns<- returns[, -7]
      }
      print(symbol_vec)
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
  return(returns)
}
