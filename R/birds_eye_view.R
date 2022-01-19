#' This function performs high level EDA on all, or a specific set of features in a dataset by taking in a dataframe object, an optional integer for the histogram bin size, an optional custom variable list, and displaying 3 different visualization sets: histograms for each numeric variable, a bar chart for each categorical variable, and a correlation heatmap of the numeric variables. The function also has built in warnings for identifying erroneous variables in the custom variable list, and which categorical variables are not suitable for bar charts based on their number of unique categories.
#'
#' @param df The dataframe on which vizualizations will be created
#' @param var_list A list. If passed, it will limit vizualizations to a subset of variables
#' @param n An integer. If passed, it will specify the number of bins for the histograms, defaults to 20
#'
#' @return a dictionary of the vizualization objects generated created by the function
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' results <- birds_eye_view(penguins)
birds_eye_view <- function(df, n=20, var_list=NULL) {
}