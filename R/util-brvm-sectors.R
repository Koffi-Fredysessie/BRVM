#' BRVM Available Sectors
#'
#' @family Utility
#'
#' @author Koffi Frederic SESSIE
#' @author Oudouss Diakité Abdoul
#' @author Steven P. Sanderson II, MPH
#'
#' @details This function will return a vector tibble of available sectors.
#'
#' @seealso \url{"https://www.richbourse.com/common/apprendre/liste-societes"}
#' @seealso \url{"https://www.richbourse.com/common/apprendre/liste-societes?page=2"}
#' @seealso \url{"https://www.richbourse.com/common/apprendre/liste-societes?page=3"}
#'
#' @description Returns a tibble of available sectors for BRVM.
#'
#' @examples
#'
#' BRVM_available_sectors()
#'
#' @return
#' A tibble
#'
#' @export
#'

BRVM_available_sectors <- function() {
  brvm_sectors_tbl <- dplyr::tibble(
    sector = c(
      "Agriculture", "Industry", "Distribution", "Finance", "Transport",
      "Public service", "Other"
    )
  )

  # Return ----
  return(brvm_sectors_tbl)
}
