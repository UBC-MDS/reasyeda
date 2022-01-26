#' Takes a dataframe object and returns a list object comprising
#' of 3 dataframes and a list. The dataframes correspond to the
#' summary statistics of numeric and categorical variables each and
#' the proportion of unique values for categorical variables. The
#' nested list is of the categorical variables that exceed the threshold
#' for considering dropping variables with high unique values.
#'
#' @param df The dataframe on which the function will operate
#' @param threshold A float. If passed, it will define the threshold for identifying the variables with high unique values, defaults to 0.8
#'
#' @return
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' summary_suggestions(penguins)
summary_suggestions <- function(df, threshold) {
}
