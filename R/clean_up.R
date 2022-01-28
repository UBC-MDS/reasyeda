#' Takes a dataframe object and returns a cleaned version with rows containing any NaN values dropped. Inspects the clean dataframe and prints a list of potential outliers for each explanatory variable, based on the threshold distance of 3 standard deviations.
#'
#' @param df The dataframe on which the function will operate
#'
#' @return the same dataframe with all the NaN's removed along with a list of potential outliers
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' results <- clean_up(penguins)
#' '**The following potenital outliers were detected:**
#' Variable X: 
#' [ 300, 301, 500, 1000 ]
#' Variable Y: 
#' [ 6.42, 6.44, 58.52, 60.22 ]'
clean_up <- function(df) {
}
