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
#' sectors <- c("Industry","Administration","PUblic service", "AUtr", "FINANCE",
#'             "distribution", 25)
#' BRVM_sector(.sectors = sectors)
#' BRVM_sector(.sectors = "All")
#' BRVM_sector(.sectors = c("Other", "Agriculture"))
#'
#' @return
#' A tibble
#'
#' @export
#'
BRVM_bySector <- function(.sectors=NULL){
  sector <- unique(str_to_title(.sectors))
  # Check input parameters ----
  if (length(sector) < 1){
    rlang::abort(
      "The '.sectors' parameter cannot be blank. Please enter at least one sector.
      If entering specific multiple please use .sectors = c(Sector_1, Sector_2, ...).
      Or simply enter .symbol = c('All') to get all sectors information"
    )
  }
  ifelse (sector == "All",
          sector<- c("Agriculture", "Industry", "Distribution", "Finance", "Transport", "Public services", "Other"),
          sector)
  
  # Scrape information about Ticker, their name and sector
  url.all<-c("https://www.richbourse.com/common/apprendre/liste-societes",
             "https://www.richbourse.com/common/apprendre/liste-societes?page=2",
             "https://www.richbourse.com/common/apprendre/liste-societes?page=3")
  
  tryCatch(
    {
      All.sector<-as.data.frame(matrix(NA, ncol = 3, nrow = 0))
      for (elem in url.all){
        brvm.sect <- read_html(elem) %>% html_nodes('table') %>% html_table()
        All.sector<-rbind(All.sector, brvm.sect[[1]][-c(1,5)])
      }
      names(All.sector)<-c("Company name", "Ticker", "Sector")
      All.sector$Sector<-str_replace(All.sector$Sector, "Industrie", "Industry")
      All.sector$Sector<-str_replace(All.sector$Sector, "Finances", "Finance")
      All.sector$Sector<-str_replace(All.sector$Sector, "Autres", "Other")
      All.sector$Sector<-str_replace(All.sector$Sector, "Services publics", "Public services")
      
      ##English
      All_sector <- unique(All.sector$Sector)
      
      #### Create a definitive sector vector
      sector_vec<-NULL
      
      ## Change to upper case the first letter of each sector
      ##And filter sector in sector list
      for (Sect in sector) {
        if (Sect %in% All_sector) {
          sector_vec<-append(sector_vec, Sect)}
      }
      
      # Check input parameters after filtering ----
      if (length(sector_vec) < 1){
        rlang::abort(
          "The '.sectors' parameter cannot be blank. Please enter at least one sector.
      If entering specific multiple please use .sectors = c(Sector_1, Sector_2, ...).
      Or simply enter .symbol = c('All') to get all sectors information"
        )
      }
      
      ###Scrape daily quote data from BRVM exchange
      # tryCatch(
      #   {
      Brvm.all <- read_html("https://www.brvm.org/en/cours-actions/0/status/200") %>% html_nodes('table') %>% html_table()
      Brvm.all <- Brvm.all[[4]]
      Brvm.all$`Change (%)`<-gsub(",", ".", Brvm.all$`Change (%)`)
      Brvm.all$`Change (%)`<-as.numeric(Brvm.all$`Change (%)`)
      Brvm.all$Volume<-gsub(" ", "", Brvm.all$Volume)
      Brvm.all$Volume<-as.numeric(Brvm.all$Volume)
      Brvm.all$`Previous price`<-gsub(" ", "", Brvm.all$`Previous price`)
      Brvm.all$`Previous price`<-as.numeric(Brvm.all$`Previous price`)
      Brvm.all$`Opening price`<-gsub(" ", "", Brvm.all$`Opening price`)
      Brvm.all$`Opening price`<-as.numeric(Brvm.all$`Opening price`)
      Brvm.all$`Closing price`<-gsub(" ", "", Brvm.all$`Closing price`)
      Brvm.all$`Closing price`<-as.numeric(Brvm.all$`Closing price`)
      colnames(Brvm.all)<-c(
        "Ticker",
        "Company name",
        "Volume",
        "Previous price",
        "Open",
        "Close",
        "Change (%)")
      
      ##Join both data by Ticker
      Brvm.all<-left_join(Brvm.all, All.sector[-1], by ="Ticker")
      
      if (length(sector_vec) == 7){
        ###That means all sector
        return(Brvm.all)
      }  else {
        sector.data<-as.data.frame(matrix(NA, ncol = 8, nrow = 0))
        names(sector.data)<-c(
          "Ticker",
          "Company name",
          "Volume",
          "Previous price",
          "Open",
          "Close",
          "Change (%)",
          "Sector")
        
        for(.elem in sector_vec) {
          dt.sector<-dplyr::filter(Brvm.all, Sector == .elem)
          print(paste0("There are ", nrow(dt.sector), " companies that belong to ", .elem, "'s sector"))
          print(dt.sector[-c(2,8)])
          sector.data<-rbind(sector.data, dt.sector)
        }
        return(sector.data)
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
