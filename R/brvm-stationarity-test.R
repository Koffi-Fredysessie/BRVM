#' Stationarity test with univariate data
#'
#' @description Performs different types of stationarity test.
#'
#' @family Test
#' @family BRVM
#' @author Koffi Frederic SESSIE
#'
#' @seealso `normality_test`
#'
#' @param x a numeric vector or time series.
#' @param type.test character such as "Box-Pierce and Ljung-Box","Kwiatkowski-Phillips-Schmidt-Shin (KPSS)", "Augmented Dickey-Fuller Test (ADF)", "Phillips-Perron Unit Root Test"
#'
#' @return a number that indicates the P-value of the stationarity test
#' @export
#'
#' @examples
#'
#' #' y <-ts(c(5353.08,5409.24,5315.57,5270.53, # one and a half week stock index
#' 5211.66,NA,NA,5160.80,5172.37))  # data including a weekend
#' stationarity_test(y, "Box-Pierce and Ljung-Box")
#'
#'
stationarity_test <- function(x, type.test) {
  if (length(unique(x)) != 1) {
    if (is.numeric(x)){
      if (is.ts(x)) {
        x <- na.remove(x)
      } else {
        x <- na.omit(x)
      }

      if(type.test == "Box-Pierce and Ljung-Box" ){
        if (length(x)>= 3) {
          pval <- Box.test(x)$p.value
        } else { pval <- "NA" }

      } else if (type.test == "Kwiatkowski-Phillips-Schmidt-Shin (KPSS)" ){
        if (length(x)>= 3) {
          pval <- kpss.test(x)$p.value } else { pval <- "NA" }

      } else if (type.test == "Augmented Dickey-Fuller Test (ADF)"){
        if (length(x)>= 7) {
          pval <- adf.test(x)$p.value
        } else { pval <- "NA" }

      } else if (type.test == "Phillips-Perron Unit Root Test"){
        if (length(x)>= 4) {
          pval <- pp.test(x)$p.value
        } else { pval <- "NA" }
      }

      # if (pval != "NA"){
      #   pval <- round(as.numeric(pval), digits = 3)
      # }

    } else {
      pval <- "NA"
    }
  } else {
    pval <- "NA"
  }

  if (pval != "NA"){
    pval <- as.numeric(pval)
  } else {
    pval <- "NA"
  }
  return(pval)
}
