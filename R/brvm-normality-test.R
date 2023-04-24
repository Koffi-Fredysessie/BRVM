#' Normality test with univariate data
#'
#' @description Performs different types of normality test.
#'
#' @family Test
#' @family BRVM
#' @author Koffi Frederic SESSIE
#'
#' @seealso `stationarity_test`
#'
#' @param x a numeric vector or time series..
#' @param type.test character such as "Anderson-Darling","Shapiro-Wilk","Jarque Bera","Cramer-von Mises","Shapiro-Francia","Lilliefors (Kolmogorov-Smirnov)","Pearson chi-square", "Agostino".
#'
#' @return a number that indicates the P-value of the normality test
#' @export
#'
#' @importFrom goftest ad.test cvm.test
#' @importFrom tseries jarque.bera.test
#' @importFrom nortest sf.test lillie.test pearson.test
#' @importFrom fBasics dagoTest
#'
#' @examples
#' \dontrun{
#'library(goftest)
#'library(tseries)
#'library(nortest)
#'library(fBasics)
#'
#'# one and a half week stock index
#'# data including a weekend
#' y <-ts(c(5353.08,5409.24,5315.57,5270.53, 5211.66,NA,NA,5160.80,5172.37,5160.80,5172.37))
#'
#' normality_test(y ,"Shapiro-Wilk")
#'
#' my_data <- BRVM_get("snts", .from = "2020-02-05", .to = "2022-02-05" )
#' normality_test((my_data$Close), "Agostino")
#' normality_test((my_data$Close[1:50]), "Jarque Bera")
#' }
#'
normality_test <- function(x, type.test) {
  if (length(unique(x)) != 1) {
    if (is.numeric(x)){
      if (is.ts(x)) {
        x <- na.remove(x)
      } else {
        x <- na.omit(x)
      }

      if(type.test == "Anderson-Darling" ){
        if (length(x)>= 8) {
          pval <- ad.test(x)$p.value
        } else { pval <- "NA" }
      } else if (type.test == "Shapiro-Wilk" ){
        if (length(x)>= 3) {
          pval <- shapiro.test(x)$p.value
        } else { pval <- "NA" }
      } else if (type.test == "Jarque Bera"){
        if (length(x)>= 3) {
          pval <- jarque.bera.test(x)$p.value
        } else { pval <- "NA" }
      } else if (type.test =="Cramer-von Mises"){
        if (length(x)>= 1) {
          pval <- goftest::cvm.test(x)$p.value
        } else { pval <- "NA" }
      } else if ( type.test == "Shapiro-Francia"){
        if (length(x)>= 5) {
          pval <- sf.test(x)$p.value
        } else { pval <- "NA" }
      } else if (type.test == "Lilliefors (Kolmogorov-Smirnov)" ){
        if (length(x)>= 5) {
          pval <- lillie.test(x)$p.value
        } else { pval <- "NA" }
      } else if (type.test == "Pearson chi-square"){
        if (length(x)>= 2) {
          pval <- pearson.test(x)$p.value
        } else { pval <- "NA" }
      } else if (type.test == "Agostino"){
        if (length(x)>= 20) {
          pval <- (dagoTest(x)@test$p.value)[[1]]
        } else { pval <- "NA" }
      }
    } else { pval <- "NA"}
  } else { pval <- "NA"}

  # if (pval != "NA"){
  #   pval <- round(as.numeric(pval), digits = 3)
  # }

  if (pval != "NA"){
    pval <- as.numeric(pval)
  } else {
    pval <- "NA"
  }

  return(pval)
}
