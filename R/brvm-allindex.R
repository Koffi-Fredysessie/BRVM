#' BRVM Available Indexes
#'
#' @description It receives no argument and returns BRVM's indexes informations.
#'
#' @family BRVM
#' 
#' @author Koffi Frederic SESSIE
#' 
#' @return
#' A character
#' 
#' @export
#' 
#' @examples
#' \dontrun{BRVM.index()}
#' 

BRVM.index <- function(){
  all_tick <- c("BRVMAG", "BRVMC", "BRVMAS", "BRVMDI",
                "BRVMFI", "BRVMIN", "BRVMSP", "BRVMTR", "BRVMPR",
                "BRVMPA", "BRVM30")
  return(all_tick)
}
