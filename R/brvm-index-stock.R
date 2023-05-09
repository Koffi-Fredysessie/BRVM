#' BRVM index stock - Given a set of indexes, return their stock data
#'
#' @param .ticker Must be at least one index between c("BRVM10","BRVMAG","BRVMC","BRVMAS","BRVMDI","BRVMFI", "BRVMIN", "BRVMSP", "BRVMTR")
#' @param Period Numeric number indicating time period. Valid entries are 0, 1, 5, 30, 91, and 365 representing respectively ‘daily’, 'one year', ‘weekly’, ‘monthly’, ‘quarterly’ and ‘yearly’ .
#' @param from A quoted start date, ie. "2020-01-01" or "2020/01/01". The date
#' must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
#' @param to A quoted end date, ie. "2022-05-20" or "2022/05/20". The date must
#' be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"
#'
#' @description Give a set of indexes and get it/their stock data. Use BRVM.index() function to know all available indexes
#'
#' @family Data Retrieval
#' @family BRVM
#' @author Koffi Frederic SESSIE
#'
#' @seealso `BRVM_get()`, `BRVM_get1()`
#'
#' @return "data.frame"
#' @export
#'
#' @examples
#'\donttest{
#' BRVM_index_stock(.ticker = "BRVMAG", from = "2018-01-04", to = "2022-01-04")
#'
#' BRVM_index_stock("BRVM10", Period = 0, from = "2021-01-04", to = "2022-01-04"  ) #To get daily data
#'
#' BRVM_index_stock("BrvmAS", Period = 1 ) # To get daily data for a whole year
#'
#' BRVM_index_stock("BRVM10", Period = 5, from = "2021-01-04", to = "2022-01-04") # To get weekly data
#'
#' BRVM_index_stock("BRVMAG", Period = 30 ) # To get monthly data
#'
#' BRVM_index_stock("BRVM10", Period = 91 ) # To get quaterly data
#'
#' BRVM_index_stock("brvmtr", Period = 365 ) # To get yearly data
#'}

BRVM_index_stock <- function(.ticker ='BRVM10',
                             Period = 0,
                             from = Sys.Date() - 89,
                             to = Sys.Date() ) {

  first_date <- lubridate::parse_date_time(from, orders = "ymd")
  end_date   <- lubridate::parse_date_time(to, orders = "ymd")

  if (first_date >= end_date){
    rlang::abort(
      "The '.from' parameter (start_date) must be less than '.to' (end_date)"
    )
  }

  else if (first_date >= Sys.Date()-2){
    rlang::abort(
      "The '.from' parameter (start_date) must be less than today's date"
    )
  }

  .ticker<- unique(toupper(.ticker))

  all_tick <- c("BRVM10",
                "BRVMAG",
                "BRVMC",
                "BRVMAS",
                "BRVMDI",
                "BRVMFI",
                "BRVMIN",
                "BRVMSP",
                "BRVMTR",
                "BRVMPR",
                "BRVM30",
                "BRVMPA"
                )

  ifelse(.ticker=="ALL",
         .ticker<-all_tick,
         .ticker)

  # first_date <-as.Date(from)
  # end_date <- as.Date(to)

  .indexes<-list("BRVM 10" = c("BRVM10"),
                 AGRICULTURE = c("BRVMAG"),
                 "BRVM COMPOSITE" =c("BRVMC"),
                 "OTHER SECTOR" = c("BRVMAS"),
                 DISTRIBUTION = c("BRVMDI"),
                 FINANCE = c("BRVMFI"),
                 INDUSTRY = c("BRVMIN"),
                 "PUBLIC SERVICES" = c("BRVMSP"),
                 TRANSPORT = c("BRVMTR"),
                 "BRVM PRESTIGE" = c("BRVMPR"),
                 "BRVM 30" = c("BRVM30"),
                 "BRVM PRINCIPAL" = c("BRVMPA"),
                 CAPITALISATION = c("CAPIBRVM"))

  # Not need because we take it in charge in the loop
  # if(year(first_date) < 2003 ){
  #   rlang::abort(
  #     "The '.from' parameter (start_date) must be greater or equal to 2003"
  #   )
  # }

  tick_vec <- NULL
  ## Filter ticker in .indexes list

  for (tick in .ticker) {
    if (tick %in% .indexes) {
      tick_vec <- c(tick_vec, tick)
    }
  }


  # Check input parameters after filtering ----
  if (length(tick_vec) < 1){
    rlang::abort(
      "The '.ticker' parameter cannot be blank. Please enter at least one ticker.
            If entering multiple please use .symbol = c(Tick_1, Tick_2, ...)"
    )
  } else {
    .ticker <- tick_vec
  }

  index_stock <- as.data.frame(matrix(NA, ncol = 6, nrow = 0))
  names(index_stock) <- c("Date", "Open", "High", "Low", "Close", "Ticker")

  tryCatch(
    {
      if (as.numeric(Period) %in% c(1, 30, 91, 365) ){
        for (Tick in .ticker) {

          my_data <- request("https://www.sikafinance.com/api/general/GetHistos") %>%
            req_body_json(list('ticker'= Tick,
                               'xperiod'= paste0(Period,''))) %>%
            req_perform() %>%
            resp_body_json(simplifyVector = T)

          my_data <- dplyr::as_tibble(my_data$lst)
          my_data$Date<-as.Date.character(my_data$Date, format = "%d/%m/%Y")
          my_data <- my_data[,-6]
          # assign(Tick, my_data, envir = globalenv())

          my_data$Ticker <- Tick

          index_stock <- rbind(index_stock, my_data)

        }

        if (length(unique(index_stock$Ticker)) > 1) {
          return(index_stock)
        } else {
          return(index_stock[, -6])
        }

      }

      else if (as.numeric(Period) %in% c(0, 5) ){

        for (Tick in .ticker) {
          stock.data <- as.data.frame(matrix(NA, ncol = 7, nrow = 0))
          names(stock.data) <- c("Date", "Open", "High", "Low", "Close", "Ticker")  #, "Ticker"

          for(.date in seq(end_date, first_date, "-3 months")){
            to_date = as.Date.POSIXct(.date)
            from_date = to_date - 89

            my_data <- request("https://www.sikafinance.com/api/general/GetHistos") %>%
              req_body_json(list('ticker'= Tick,
                                 'datedeb'= from_date,
                                 'datefin'= to_date,
                                 'xperiod'= paste0(Period,''))) %>%
              req_perform() %>%
              resp_body_json(simplifyVector = T)

            if (length(my_data$lst)==6) {
              my_data <- dplyr::as_tibble(my_data$lst)
              stock.data <- rbind(stock.data, my_data)
            }

          }

          if (length(stock.data)==6 && nrow(stock.data)!=0) {

            stock.data$Date<-as.Date.character(stock.data$Date, format = "%d/%m/%Y")

            ifelse (any(duplicated(stock.data$Date)),
                    stock.data<-stock.data%>%
                      dplyr::group_by(Date)%>%
                      summarise(Open=mean(Open),
                                High= mean(High),
                                Low= mean(Low),
                                Close= mean(Close)),
                    stock.data)
            message(paste0("We obtained ",Tick,  " data from ",
                         min(stock.data$Date),
                         " to ",
                         max(stock.data$Date)))

            #        stock.data <- stock.data[, -6]
            # assign(Tick, stock.data, envir = globalenv())
            stock.data$Ticker <- Tick

            index_stock <- rbind(index_stock, stock.data )

          } else {
            message(paste0(Tick,"data aren't available between ",
                         first_date,
                         " and ",
                         end_date))
          }

        }

        if (length(unique(index_stock$Ticker)) > 1) {
          return(index_stock)
        } else {
            index_stock <- index_stock[, -6]
            return(index_stock)
        }


      }

      else {
        message("Choose the best period between 0, 1, 5, 30, 91 and 365")
      }

    },
    error = function(e) {
      message("Make sure you have an active internet connection")
    },
    warning = function(w) {
      message("Make sure you have an active internet connection")
    }
  )

}
