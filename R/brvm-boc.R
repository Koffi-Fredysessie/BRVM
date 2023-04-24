#' BRVM Official Quotation reviews
#'
#' @description This function receives as input a day of the week (working day) and returns the official quotation revews of that day.
#'
#' @family Data Retrieval
#' @family BRVM
#' @author Koffi Frederic SESSIE
#'
#' @param .weekday A quoted date, ie. "2022-01-31" or "2022/01/31". The date must
#' be in ymd format "YYYY-MM-DD" or "YYYY/MM/DD". Must not be a weekend or a holiday
#'
#' @return
#' A formatabble table
#'
#' @export
#'
#'@importFrom formattable color_tile formattable formatter icontext style
#'@importFrom httr content POST
#'@importFrom lubridate parse_date_time
#'@importFrom rvest html_table html_elements
#'@importFrom stringr str_sub
#'@importFrom timeDate isWeekday
#'
#' @examples
#'\dontrun{
#' library(httr)
#' library(lubridate)
#' library(rvest)
#' library(timeDate)
#' library(formattable)
#' library(stringr)
#'
#' BRVM_stock_market("2022-04-25")
#' BRVM_stock_market("2021-03-25")
#'}

BRVM_stock_market <- function(.weekday){
  the_date <- lubridate::parse_date_time(.weekday, orders = "ymd")
  #  the_date <- as.POSIXct(.weekday)
  if (the_date < Sys.Date()) {
    tryCatch(
      {
        if (isWeekday(the_date)) {
          #      "http://www.abourse.com/histoActionsJour.html/status/200"
          res<- POST("http://www.abourse.com/histoActionsJour.html",
                     body = list(date = the_date,
                                 submit = "Valider"),
                     encode = "form")

          stock_data<- content(res, encoding = "UTF-8") %>%
            rvest::html_elements('table') %>%
            rvest::html_table()

          if (length(stock_data)!=0) {
            stock_data <- stock_data[[1]]

            colnames(stock_data) <- c("Ticker", "Equity", "Volume", "Value", "Previous price",
                                      "Open", "Close", "Mean", "Change (%)", "Annual change (%)",
                                      "Reference price", "Low", "High", "Net Income", "Date",
                                      "Compartment", "Yield Net (%)", "PER")
            ##Remove first line
            stock_data <- stock_data[-1,]
            stock_data<- stock_data[, -8] # remove column 8 (mean)

            for (i in 1 : nrow(stock_data)){
              if (stock_data[i,1] == "SECTEUR - Industrie"){
                stock_data[i,1:4] = "INDUSTRY SECTOR"
              }

              else if (stock_data[i,1] == "SECTEUR - Services Publics" ){
                stock_data[i,1:4] = " PUBLIC SERVICES SECTOR"
              }

              else if (stock_data[i,1] == "SECTEUR - Finances" ){
                stock_data[i,1:4] = "FINANCE SECTOR"
              }

              else if (stock_data[i,1] == "SECTEUR - Transport" ){
                stock_data[i,1:4] = "TRANSPORT SECTOR"
              }

              else if (stock_data[i,1] == "SECTEUR - Agriculture" ){
                stock_data[i,1:4] = "AGRICULTURE SECTOR"
              }

              else if (stock_data[i,1] == "SECTEUR - Distribution" ){
                stock_data[i,1:4] = "DISTRIBUTION SECTOR"
              }

              else if (stock_data[i,1] == "SECTEUR - Autres Secteurs" ){
                stock_data[i,1:4] = "OTHER SECTOR"
              }

              else if (str_sub(stock_data[i,1], 1,13) == "TOTAL - March" ){
                    stock_data[i,1:2] = "TOTAL - Equities market"
                }

              # else if (stock_data[i,1] == "TOTAL - Marché des actions" ){
              #   stock_data[i,1:2] = "TOTAL - Equities market"
              # }


            }

            # if (str_sub(stock_data[NROW(stock_data),1], 1,13) == "TOTAL - March") {
            #     stock_data[NROW(stock_data),1:2] = "TOTAL - Equities market"
            # }

            ###Remove duplication for sector name
            stock_data[c(1, 15, 21, 38, 42, 49, 58),-c(1,5)] <- ""

            ##For total
            stock_data[c(14, 20, 37, 41, 48, 57, 60, 61),2] <- ""
            #stock_data<- stock_data[, -8]   #Remove the moy

            for (i in 1 : nrow(stock_data)){
              for (j in 3 :length(stock_data)){
                stock_data[i, j] <- gsub(" " , "", stock_data[i, j])
                stock_data[i, j] <- gsub("," , ".", stock_data[i, j])

              }
            }

            stock_data$`Change (%)` <- gsub("%" , "", stock_data$`Change (%)`)
            stock_data$`Yield Net (%)` <- gsub("%" , "", stock_data$`Yield Net (%)`)
            stock_data$`Annual change (%)` <- gsub("%" , "", stock_data$`Annual change (%)`)


            #        stock_data$Volume <- as.numeric(stock_data$Volume)
            # stock_data$Value <- as.numeric(stock_data$Value)
            stock_data$`Change (%)` <- as.numeric(stock_data$`Change (%)`)
            # stock_data$`Annual change (%)` <- as.numeric(stock_data$`Annual change (%)`)
            # stock_data$`Reference price` <- as.numeric(stock_data$`Reference price`)
            # stock_data$`Low` <- as.numeric(stock_data$`Low`)
            # stock_data$High <- as.numeric(stock_data$High)
            # stock_data$`Net Income` <- as.numeric(stock_data$`Net Income`)
            # stock_data$`Yield Net (%)` <- as.numeric(stock_data$`Yield Net (%)`)
            # stock_data$PER <- as.numeric(stock_data$PER)
            # stock_data$Date <- as.Date.character(stock_data$Date, format = "%d/%m/%Y")
            stock_data$Compartment <- as.factor(stock_data$Compartment)


            stock_data<- formattable(stock_data,
                                     align =c("l","l", "c", "r", "c","c", "c", "l",
                                              "c", "c", "c","c", "c", "c","c", "c", "c"),
                                     list(`Close` = color_tile("transparent", "lightpink"),
                                          `Change (%)` = formatter("span",
                                                                   style = x ~ style(font.weight = "bold",
                                                                                     color = ifelse(x<0, "red",
                                                                                                    ifelse(x > 0, "green", "black"))),
                                                                   x ~ icontext(ifelse(x>0, "arrow-up",
                                                                                       ifelse(x<0,"arrow-down","")),
                                                                                round(x,2)))
                                     ))


            #Add to renderformattable

            # improvement_formatter <- formatter("span",
            #                                    style = x ~ style(font.weight = "bold",
            #                                                      color = ifelse(x > 0, "green", ifelse(x < 0, "red","black"))),
            #                                    x ~ icontext(ifelse(x < 0, "arrow-down", "arrow-up"), x)
            # )
            #
            # stock_data <- formattable(stock_data,
            # align =c("l","l", "c", "c", "c","c", "c", "c",
            #          "c", "c", "c","c", "c", "c","c", "c", "c"),
            #                           list(`Close` = color_tile("transparent", "green"),
            #                                `Change (%)` = improvement_formatter,
            #                                `Volume` = color_tile("transparent", "pink")
            #                           ))

            # stock_data <- kable(stock_data)%>%
            #   kable_minimal()%>%  #This one is th best
            #   #    kable_paper("striped", full_width =F)%>%
            #   add_header_above(c(" " = 2,
            #                      "Day summary" = 2,
            #                      " " = 1,
            #                      "Share price" = 2,
            #                      " " = 3,
            #                      "Maximum deviations" = 2,
            #                      "Last dividend paid" =2,
            #                      " "= 3))

            return(stock_data)

          } else {
            print("The date to be entered must not be a public holiday")
          }
        } else {
          print("The date to be entered must not be a weekend")
        }
      },
      error = function(e) {
        print("Make sure you have an active internet connection")
      },
      warning = function(w) {
        print("Make sure you have an active internet connection")
      }
    )

  } else {
    print("The date to be entered must not be greater than or equal to today's date")
  }
}
