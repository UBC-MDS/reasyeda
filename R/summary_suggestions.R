#' Takes a dataframe object and returns a nested list object comprising
#' of three lists. The first element of the output list corresponds
#' to the descriptive statistics of numeric variables,
#' the second element displays a list of summary data for the 
#' categorical variables and the final element calculates the count 
#' and proportion of distinct values in each categorical column. 
#' The last object of the output list can be used to determine
#' which categorical variables to drop due to high proportion of
#' unique values based on an input threshold value.
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
#' [
#' (summary statistics for numeric variables),
#' (summary statistics for categorical variables),
#' (percentage of unique values for categorical variables),
#' [list of variables with percentage of unique values higher than the threshold]
#' ]


summary_suggestions <- function(df, threshold = 0.8) {
  
  # Exception handling
  
  if (!is.data.frame(df)) {
    stop("Input df should be a dataframe object")
  }
  
  if (!is.numeric(threshold)) {
    stop("Input threshold should be a numeric value between 0 and 1")
  }
  
  if (threshold > 1) {
    stop("Input threshold must be a number between 0 and 1")
  }
  
  
  if (threshold < 0) {
    stop("Input threshold must be a number between 0 and 1")
  }
  
  
  library(dplyr)
  library(Hmisc)
  library(pastecs)
  
  # summary table for numeric columns
  numeric_summary_df <-  df |> 
    select_if(is_numeric) |> 
    stat.desc()
  
  
  # summary for categorical columns
  categorical_summary_df <-  df |> 
    select_if(function(col) is_character(col) |
                is.factor(col)) |>
    describe()
  
  # list of categorical columns
  categorical_cols <- df |>
    select_if(function(col) is_character(col) |
                is.factor(col)) |>
    colnames()
  
  unique_vars_df <- tibble()
  for (col in categorical_cols) {
    unique_count <- df |>
      select({{col}})  |>
      n_distinct()
    
    if (((unique_count)/ nrow(df)) > threshold) {
      unique_vars <- tibble(variable = {{col}},
                            unique_values = unique_count,
                            unique_values_prop = (unique_count)/ nrow(df))
      
      unique_vars_df <- rbind(unique_vars_df, unique_vars)
    }
  }
  
  return(list(numeric_summary_df, 
              categorical_summary_df,
              unique_vars_df))
}

toy_data = tibble(
  "income"= c(5, 8, 10, 12, 17, 19),
  "house_size"= c(700, 600, 900, 1000, 1200, 1500),
  "views"= c("mountain", "mountain", "sea", "mountain", "urban", "forest"),
  "test"= c("a", "b", "e", "c", "d", "b"),
  "price"= c(65, 50, 80, 98.5, 112, 133),
  "doctor_visits"= c(6, 8, 4, 5, 3, 2),
)
df = as_data_frame(toy_data)

summary_suggestions(df)
