#' Get BRVM Bonds info
#'
#' @param input is a parameter representing one the category in ("All", "State", "Private", "Regional") and returns a processed dataframe bonds_brvm. The function also uses the separate function to split the "Last payment (Date/Value)" column into "Date" and "Value" columns.
#'
#' @return dataframe
#' @export
#'
#' @examples
#' all_bonds = BRVM_Bonds("All")
#' head(all_bonds)
#'
#' st_bonds = BRVM_Bonds("State")
#' head(st_bonds)
#'
#' prv_bonds = BRVM_Bonds("Private")
#' head(prv_bonds)
#'
#' reg_bonds = BRVM_Bonds("Regional")
#'head(reg_bonds)
#'

BRVM_Bonds <- function(input = "All") {
    # Convert input to title case
    category <- str_to_title(input)

    # Check if input is valid
    valid_options <- c("All", "State", "Private", "Regional")
    if (!(category %in% valid_options)) {
        stop("Input must be one of: All, State, Private, Regional")
    }

    # Define the base URL for "All" and specific categories
    base_url <- switch(
        category,
        "All" = "https://www.brvm.org/en/cours-obligations/0/status/200",
        "State" = "https://www.brvm.org/en/cours-obligations/20",
        "Private" = "https://www.brvm.org/en/cours-obligations/55",
        "Regional" = "https://www.brvm.org/en/cours-obligations/21"
    )

    # Read HTML from the URL
    bonds_brvm <- read_html(base_url) %>%
        html_nodes('table') %>%
        html_table()

    # Extract the fourth table (adjust index based on your specific case)
    bonds_brvm <- bonds_brvm[[4]]

    # Remove Maturity column if all values are NA
    if (all(is.na(bonds_brvm[, 4]))) {
        bonds_brvm <- bonds_brvm[, -4]
    }

    bonds_brvm = separate(bonds_brvm, `Last payment (Date/Value)`, into = c("Date", "Value"), sep = " / ", convert = TRUE)

    return(bonds_brvm)
}
