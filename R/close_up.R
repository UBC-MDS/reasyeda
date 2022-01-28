#' Accepts a dataframe and the number of pairs of variables with strongest correlations. It creates scatterplots with a linear trend for each pair of variables with stronglest correlations.
#'
#' @param df The dataframe on which the function will operate
#' @param n The number of pairs of variables with strongest correlations to be displayed, defaults to 1
#'
#' @return chart
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' close_up(penguins)
close_up <- function(df, n=1) {

  # check if input is a DataFrame
  if (!is.data.frame(df)) {
    stop("Input df should be a data frame.")
  }

  # check if n is integer
  if (n %% 1 != 0) {
    stop("n should be integer.")
  }

  # calculate max allowable integer
  numeric = unlist(lapply(df, is.numeric))
  corr_matrix = stats::cor(df[,numeric], method = c("pearson"), use = "complete.obs")
  N_max = nrow(corr_matrix) * (nrow(corr_matrix) - 1) / 2

  # check if input exceeds max allowable integer
  if (n > N_max) {
    stop("n exceeds total number of coefficients.")
  }

  # initialization
  corr_matrix[lower.tri(corr_matrix)] <- 0 # lower triangle set to zero
  diag(corr_matrix)  <- 0 # zero diagonal
  corr = as.data.frame(abs(corr_matrix))
  max_col = which.max(sapply(corr, max, na.rm = TRUE))
  max_row = which.max(corr[[max_col]])
  plots <- vector('list', n)

  # use for loop to plot
  for (i in seq_along(seq(1:n))) {
    max_col = which.max(sapply(corr, max, na.rm = TRUE))
    max_row = which.max(corr[[max_col]])
    coef = corr_matrix[max_row, max_col]

    plots[[i]] <- df |>
      ggplot2::ggplot(ggplot2::aes_string(x = names(corr)[max_row],
                 y = names(corr)[max_col])) +
      ggplot2::geom_point() +
      ggplot2::geom_smooth(formula = y ~ x, method = "lm", se = FALSE) +
      ggplot2::ggtitle(sprintf("coeff: %.3f", coef))

    corr[max_row, max_col] <- 0
  }

  # generate one big chart
  chart <- cowplot::plot_grid(plotlist=plots, ncol = 1)

  return(chart)
}

