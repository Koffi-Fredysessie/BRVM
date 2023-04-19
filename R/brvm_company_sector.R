
#' Company's sector - To know the sector of a given company
#'
#' @family Data Retrieval
#' @family BRVM
#'
#' @author Koffi Frederic SESSIE
#'
#' @description It receives one company listed on the BRVM stock exchange,
#' Turn to  upper case your input by using `toupper()`  and returns informations about the company's sector.
#'
#' @param company The name of company listed on the BRVM stock exchange
#'
#' @return "character"
#'
#' @export
#'
#' @examples
#' company_sector("BICC")
#' company_sector("SNTS")
#'
#'
company_sector <- function(company){

    company<-toupper(company)

    .sectors =list(Agriculture = c("PALC","SCRC","SICC","SOGC","SPHC"),
                   Distribution = c("ABJC","BNBC","CFAC","PRSC","SHEC","TTLC","TTLS"),
                   Industry = c("CABC","FTSC","NEIC","NTLC","SEMC","SIVC","SLBC","SMBC","STBC","TTRC","UNLC","UNXC"),
                   Finance = c("BOAB","BOABF","BOAC","BOAM","BOAN","BOAS","BICC","CBIBF","ECOC","ETIT","NSBC","ORGT","SAFC","SGBC","SIBC"),
                   Transport = c("SDSC","SVOC"),
                   "Public service" = c("CIEC","ONTBF","SDCC","SNTS", "ORAC"),
                   Other = c("STAC"))


    for (elem in 1 :length(.sectors)){
        if (company %in% .sectors[[elem]]) {
            return(names(.sectors)[[elem]])
        }
    }
}
