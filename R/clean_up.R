#' Takes a dataframe object and returns a cleaned version with the NaN values removed. It also prints a list of potential outliers for each explanatory variable, based on a threshold distance from the respective median value.
#'
#' @param df The dataframe on which the function will operate
#'
#' @return the same dataframe with all the NaN's removed
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' results <- clean_up(penguins)
clean_up <- function(df) {
}