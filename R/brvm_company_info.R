#' BRVM Get info about a ticker beta, RSI, Closing, Valorisation, etc.
#'
#' @author Koffi Frederic SESSIE
#'
#' @description It receives the ticker of a company or index listed on the BRVM stock exchange,
#' Turn to  upper case the input by using `toupper()` and returns informations about the company's RSI, Beta, Closing price, etc. .
#'
#' @seealso \url{https://www.sikafinance.com}
#'
#' @param ticker The ticker of a company
#'
#' @return A tibble
#' @export
#'
#' @importFrom rvest html_elements read_html
#'
#' @examples
#' BRVM_company_info("BOAS")
#' BRVM_company_info("BoaM")
#' BRVM_company_info("BRVMAG")
#'
#'
BRVM_company_info<- function(ticker){
  ticker<-toupper(ticker)

  all_tickers <- c( "ABJC", "BICC", "BNBC", "BOAB", "BOABF", "BOAC",
                    "BOAM", "BOAN", "BOAS", "CABC", "CBIBF", "CFAC",
                    "CIEC", "ECOC", "ETIT", "FTSC", "NEIC", "NSBC",
                    "NTLC", "ONTBF", "ORGT", "ORAC", "PALC", "PRSC", "SAFC",
                    "SCRC", "SDCC", "SDSC", "SEMC", "SGBC", "SHEC",
                    "SIBC", "SICC", "SIVC", "SLBC", "SMBC", "SNTS",
                    "SOGC", "SPHC", "STAC", "STBC", "TTLC",
                    "TTLS", "UNLC", "UNXC"
                    #, "TTRC", "SVOC"
  )

  Countries<-list(BENIN =c("BOAB"), "BURKINA FASO" = c("BOABF", "CBIBF", "ONTBF"),
                  "IVORY COAST" = c("ABJC", "BICC", "BNBC","BOAC", "CABC", "CFAC", "CIEC", "ECOC", "FTSC", "NEIC",
                                    "NSBC","NTLC", "ORAC", "PALC", "PRSC", "SAFC", "SCRC", "SDCC", "SDSC", "SEMC","SGBC",
                                    "SHEC", "SIBC", "SICC", "SIVC", "SLBC", "SMBC", "SOGC","SPHC", "STAC", "STBC",
                                    "SVOC", "TTLC", "TTRC", "UNLC","UNXC"),
                  MALI = c("BOAM"), NIGER = c("BOAN"),
                  SENEGAL = c("BOAS", "SNTS", "TTLS"),
                  TOGO = c("ETIT", "ORGT"))


  # all_indexes <- c("BRVM10", "BRVMAG", "BRVMC", "BRVMAS", "BRVMDI",
  #                  "BRVMFI", "BRVMIN", "BRVMSP", "BRVMTR", "BRVMPR",
  #                  "BRVMPA", "BRVM30", "CAPIBRVM")

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
                 "BRVM PRINCIPAL" = c("BRVMPA"),
                 "BRVM 30" = c("BRVM30"),
                 CAPITALISATION = c("CAPIBRVM"))


  if (ticker %in% .indexes) {
      adn_ticker <-  ticker
      url <-paste0("https://www.sikafinance.com/marches/cotation_", adn_ticker)

  } else if (ticker %in% all_tickers){
      # url<-paste0("https://www.sikafinance.com/marches/cotation_", ticker)
      if (company_country(ticker) %in% names(Countries)){
          if (company_country(ticker) == "BENIN") {
              adn<- ".bj"
          } else if (company_country(ticker) == "BURKINA FASO") {
              adn<- ".bf"
          } else if (company_country(ticker) == "IVORY COAST") {
              adn<- ".ci"
          } else if (company_country(ticker) == "MALI") {
              adn<- ".ml"
          } else if (company_country(ticker) == "NIGER") {
              adn<- ".ne"
          } else if (company_country(ticker) == "SENEGAL") {
              adn<- ".sn"
          } else if (company_country(ticker) == "TOGO") {
              adn<- ".tg"
          }
          # adn_ticker <- paste0(ticker, adn)
          # url <-paste0("https://www.sikafinance.com/marches/cotation_", adn_ticker)
          url <-paste0("https://www.sikafinance.com/marches/cotation_", ticker, adn)
          # message(url)
    } else {
        message(paste0("Be sure that ", ticker, " belong's to BRVM stock market"))
    }

  } else {
      message(paste0("Be sure that ", ticker, " belong's to BRVM stock market"))
  }




  ##Create empty dataframe
  ticker_info<-as.data.frame(matrix(NA, ncol = 2, nrow = 0))
  tryCatch({
    val<- read_html(url) %>% html_elements('table') %>% html_table()
    # for (i in 2:4){
    #   # val<- (read_html(url) %>% html_elements('table') %>% html_table())[[i]]
    #
    #
    #   ticker_info<-rbind(ticker_info, val[[i]])
    # }
    ticker_info <- rbind(val[[2]], val[[3]], val[[4]])

    # colnames(ticker_info) <- NULL
    colnames(ticker_info) <- c("Informations", "Values")
    return(ticker_info)
  },
  error = function(e) {
    message("Make sure you have an active internet connection")
  },
  warning = function(w) {
    message("Make sure you have an active internet connection")
  })
}
