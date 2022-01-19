#' Takes a dataframe object and displays a table of summary statistics. Underneath that table it prints analysis considerations that help highlight potential issues, if applicable, and serves as a general guideline for the analysis.
#'
#' @param df The dataframe on which the function will operate
#'
#' @return
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' summary_suggestions(penguins)
#' '**Potential Analysis Considerations:**
#' Please review, and take the following into consideration: Unique Values: Variable X is comprised of 97% unique values in it's observations.'
summary_suggestions <- function(df) {
}