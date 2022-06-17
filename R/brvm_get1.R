#' BRVM Get - Get BRVM stock exchange Ticker Data
#'
#' @description This function will get data from the Sikafinance exchange.
#'
#' @family Data Retrieval
#' @family Sikafinance
#'
#' @author Koffi Frederic SESSIE
#'
#' @seealso \url{https://www.sikafinance.com/}
#' @seealso `BRVM_ticker_desc()`, `BRVM_tickers()`, `BRVM_get()`, `BRVM_index_stock()`
#'
#' @details This function will get data of the companies listed on the BVRM exchange through the sikafinance site. The function
#' takes in a single parameter of `ticker` The function will auto-format the
#' tickers you input into all upper case by using `toupper()` 
#'
#' @param ticker A vector of ticker, like: c("BICC","XOM","SlbC", "BRvm10")
#' @param Period Numeric number indicating time period. Valid entries are 0, 1, 5, 30, 91, and 365 representing respectively ‘daily’, 'one year', ‘weekly’, ‘monthly’, ‘quarterly’ and ‘yearly’.
#' @param from A quoted start date, ie. "2020-01-01" or "2020/01/01". The data
#' must be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD".
#' @param to A quoted end date, ie. "2022-01-31" or "2022/01/31". The date must
#' be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD"
#'
#' @examples
#' symbols <- c("BiCc","XOM","SlbC")
#' data_tbl <- BRVM_get1(ticker = symbols)
#' data_tbl
#'
#' BRVM_get1("ALL INDEXES", from = Sys.Date() - 252*3, to = Sys.Date()) #From three year ago to the present
#' BRVM_get1(.ticker = "BRVMAG", from = "2010-01-04", to = "2022-01-04")
#' 
#' BRVM_get1("ALL", Period = 0, from = "2010-01-04", to = "2022-01-04"  ) #To get daily data
#' 
#' BRVM_get1("BrvmAS", Period = 1 ) # To get daily data for a whole year 
#' 
#' BRVM_get1(c("BRVM10", "BRVMAG"), Period = 5, from = "2021-01-04", to = "2022-01-04") # To get weekly data
#'
#' BRVM_get1("BRVMAG", Period = 30 ) # To get monthly data
#' 
#' BRVM_get1("BRVM10", Period = 91 ) # To get quaterly data
#' 
#' BRVM_get1(c("brvmtr", "BiCc", "BOAS"), Period = 365 ) # To get yearly data
#' 
#' @return
#' A tibble
#'
#' @export
#'

BRVM_get1 <- function(ticker ='BICC',
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
  
  ticker <- unique(toupper(ticker))
  all_tickers <- c( "ABJC", "BICC", "BNBC", "BOAB", "BOABF", "BOAC",
                "BOAM", "BOAN", "BOAS", "CABC", "CBIBF", "CFAC",
                "CIEC", "ECOC", "ETIT", "FTSC", "NEIC", "NSBC",
                "NTLC", "ONTBF", "ORGT", "PALC", "PRSC", "SAFC",
                "SCRC", "SDCC", "SDSC", "SEMC", "SGBC", "SHEC",
                "SIBC", "SICC", "SIVC", "SLBC", "SMBC", "SNTS",
                "SOGC", "SPHC", "STAC", "STBC", "SVOC", "TTLC",
                "TTLS", "UNLC", "UNXC"
                #, "TTRC"
  )
  
  # idx <- c("BRVM10","BRVMAG", "BRVMC","BRVMAS",
  #          "BRVMDI", "BRVMFI", "BRVMIN", "BRVMSP", "BRVMTR")
  
  all_indexes <- c("BRVM10", "BRVMAG", "BRVMC", "BRVMAS", "BRVMDI",
                "BRVMFI", "BRVMIN", "BRVMSP", "BRVMTR")
  
  ifelse(ticker =="ALL", 
         ticker <- all_tickers,
         ticker)
  
  ifelse(ticker =="ALL INDEXES", 
         ticker <- all_indexes,
         ticker)
  
  .indexes<-list("BRVM 10" = c("BRVM10"),
                 AGRICULTURE = c("BRVMAG"),
                 "BRVM COMPOSITE" =c("BRVMC"),
                 "OTHER SECTOR" = c("BRVMAS"),
                 DISTRIBUTION = c("BRVMDI"),    
                 FINANCE = c("BRVMFI"),
                 INDUSTRY = c("BRVMIN"),
                 "PUBLIC SERVICES" = c("BRVMSP"),
                 TRANSPORT = c("BRVMTR"))
  
  tick_vec <- NULL
  ## Filter ticker in .indexes or all_ticker list
  
  for (tick in ticker) {
    if (tick %in% .indexes) {
      tick_vec <- c(tick_vec, tick)
    } else if (tick %in% all_tickers){
      if (company_country(tick) == "BENIN") {
        adn <- paste0(tick,".bj")
      } else if (company_country(tick) == "BURKINA FASO") {
        adn <- paste0(tick,".bf")
      } else if (company_country(tick) == "IVORY COAST") {
        adn <- paste0(tick,".ci")
      } else if (company_country(tick) == "MALI") {
        adn <- paste0(tick,".ml")
      } else if (company_country(tick) == "NIGER") {
        adn <- paste0(tick,".ne")
      } else if (company_country(tick) == "SENEGAL") {
        adn <- paste0(tick,".sn")
      } else if (company_country(tick) == "TOGO") {
        adn <- paste0(tick,".tg")
      }
      tick_vec <- c(tick_vec, adn)
      
    }
  }
  
  # Check input parameters after filtering ----
  if (length(tick_vec) < 1){
    rlang::abort(
      "The 'ticker' parameter cannot be blank. Please enter at least one ticker.
            If entering multiple please use .symbol = c(Tick_1, Tick_2, ...)"
    )
  } else {
    ticker <- tick_vec
  }
  
  index_stock <- as.data.frame(matrix(NA, ncol = 6, nrow = 0))
  names(index_stock) <- c("Date", "Open", "High", "Low", "Close", "Ticker")
  
  tryCatch(
    {
      if (as.numeric(Period) %in% c(1, 30, 91, 365) ){
        for (Tick in ticker) {
          ifelse(nchar(Tick) == 7,
                 Tick1 <- str_sub(Tick, 1,4),
                 Tick1 <- Tick)
          
          my_data <- request("https://www.sikafinance.com/api/general/GetHistos") %>%
            req_body_json(list('ticker'= Tick,
                               'xperiod'= paste0(Period,''))) %>%
            req_perform() %>%
            resp_body_json(simplifyVector = T)
          
          my_data <- dplyr::as_tibble(my_data$lst)
          my_data$Date<-as.Date.character(my_data$Date, format = "%d/%m/%Y")
          my_data <- my_data[,-6]
          assign(Tick1, my_data, envir = globalenv())
          
          # if (nchar(Tick) == 7) {
          #   my_data$Ticker <- str_sub(Tick, 1,4)
          # } else {
          #   my_data$Ticker <- Tick
          # }
          
          my_data$Ticker <- Tick1
          
          index_stock <- rbind(index_stock, my_data)
          
        }
        
        if (length(unique(index_stock$Ticker)) > 1) {
          return(index_stock)
        } else {
          return(index_stock[, -6])
        }
        
      } 
      
      else if (as.numeric(Period) %in% c(0, 5) ){ 
        
        for (Tick in ticker) {
          ifelse(nchar(Tick) == 7,
                 Tick1 <- str_sub(Tick, 1,4),
                 Tick1 <- Tick)
          
          stock.data <- as.data.frame(matrix(NA, ncol = 7, nrow = 0))
          names(stock.data) <- c("Date", "Open", "High", "Low", "Close", "Ticker")
          
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
            
            print(paste0("We obtained ",Tick1,  " data from ",
                         min(stock.data$Date),
                         " to ", 
                         max(stock.data$Date)))
            
            #        stock.data <- stock.data[, -6]
            assign(Tick1, stock.data, envir = globalenv())
            stock.data$Ticker <- Tick1
            
            index_stock <- rbind(index_stock, stock.data )
            
            # ifelse(length(unique(index_stock$Ticker)) > 1,
            #        return(index_stock),
            #        return(index_stock[, -6]))
            
          } else {
            print(paste0(Tick1," data aren't available between ",
                         first_date,
                         " and ", 
                         end_date))
          }
          
        }
        
        if (length(unique(index_stock$Ticker)) > 1) {
          return(index_stock)
        } else {
          return(index_stock[, -6])
        }
      
      }
      
      else {
        print("Choose the best period between 0, 1, 5, 30, 91 and 365")
      }
      
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
  
}

