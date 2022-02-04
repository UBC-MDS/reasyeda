#' Clean up the dataframe and detect outliers
#'
#' Takes a dataframe object and returns a cleaned version with rows containing any NaN values dropped. Inspects the clean dataframe and prints a list of potential outliers for each explanatory variable.
#'
#' @param df The dataframe on which the function will operate
#'
#' @return the same dataframe with all the NaN's removed along with a list of potential outliers
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' results <- clean_up(penguins)
#' '**The following potential outliers are detected:**
#' $Variable X:
#' 300, 301, 500, 1000
#' Variable Y:
#' 6.42, 6.44, 58.52, 60.22'
clean_up <- function(df) {

  # check the if the input is a dataframe object
  if (!is.data.frame(df)) {
    stop("the input df must be a data.frame like object")
  }

  # drop any rows with missing value
  clean_df <- stats::na.omit(df)

  # print statement
  print("**The following potenital outliers are detected:**")

  # detecting outliers from numeric columns
  outliers <- clean_df |>
    dplyr::select_if(is.numeric) |>
    purrr::map(~ boxplot.stats(.x)$out)

  # printing the final results
  print(outliers)
  clean_df
}
