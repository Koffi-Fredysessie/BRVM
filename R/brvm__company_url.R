#' BRVM company url
#'
#' @description It receives the ticker name and return an URL
#'
#' @family BRVM
#' @author Koffi Frederic SESSIE
#'
#' @param company is the name of the Ticker
#'
#' @return
#' URL
#'
#' @export
#'
#' @examples
#' BRVM_company_url("BICC")
#'
BRVM_company_url <- function(company){
  company<-toupper(company)
  if (company_country(company) == "BENIN") {
    adn<- "bj"
  } else if (company_country(company) == "BURKINA FASO") {
    adn<- "bf"
  } else if (company_country(company) == "IVORY COAST") {
    adn<- "ci"
  } else if (company_country(company) == "MALI") {
    adn<- "ml"
  } else if (company_country(company) == "NIGER") {
    adn<- "ne"
  } else if (company_country(company) == "SENEGAL") {
    adn<- "sn"
  } else if (company_country(company) == "TOGO") {
    adn<- "tg"
  }
  ok<-paste0("https://www.sikafinance.com/marches/cotation_", company, ".",adn)
  return(ok)
}
