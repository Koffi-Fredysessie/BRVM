#' Company's country - To know the country of a given company
#'
#' @family Data Retrieval
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#'
#' @description It receives one company listed on the BRVM stock exchange,
#' Turn to  upper case your input by using `toupper()`  and returns informations about the company's country.
#'
#' @param company The name of company listed on the BRVM stock exchange
#'
#' @return "character"
#' @export
#'
#' @examples
#'
#' company_country("BICC")
#' company_country("SNTS")
#'
#'
company_country <- function(company){

  company<-toupper(company)

  Countries<-list(BENIN =c("BOAB", "LNBB"), "BURKINA FASO" = c("BOABF", "CBIBF", "ONTBF"),
                  "IVORY COAST" = c("ABJC", "BICC", "BNBC","BOAC", "CABC", "CFAC", "CIEC", "ECOC", "FTSC", "NEIC",
                                    "NSBC","NTLC", "ORAC", "PALC", "PRSC", "SAFC", "SCRC", "SDCC", "SDSC", "SEMC","SGBC",
                                    "SHEC", "SIBC", "SICC", "SIVC", "SLBC", "SMBC", "SOGC","SPHC", "STAC", "STBC",
                                    "SVOC", "TTLC", "TTRC", "UNLC","UNXC"),
                  MALI = c("BOAM"), NIGER = c("BOAN"),
                  SENEGAL = c("BOAS", "SNTS", "TTLS"),
                  TOGO = c("ETIT", "ORGT"))

  for (elem in 1 :length(Countries)){
    if (company %in% Countries[[elem]]) {
      return(names(Countries)[[elem]])
    }
  }
}
