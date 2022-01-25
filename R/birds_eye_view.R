#' This function performs high level EDA on all, or a specific set of features in a dataset by taking in a dataframe object, an optional integer for the histogram bin size, an optional custom variable list, and displaying 3 different visualization sets: histograms for each numeric variable, a bar chart for each categorical variable, and a correlation heatmap of the numeric variables. The function also has built in errors for identifying erroneous variables in the custom variable list.
#'
#' @param df A data.frame. The dataframe on which visualizations will be created
#' @param var_list A vector. If passed, it will limit visualizations to a subset of variables
#' @param n An integer. If passed, it will specify the number of bins for the histograms, defaults to 20
#'
#' @return a dictionary of the visualization objects generated created by the function
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' results <- birds_eye_view(penguins)
birds_eye_view <- function(df, n = 20, var_list = NULL) {

  # Testing

  if (!is.data.frame(df)) {
    stop("Input for df not a data frame")
  }

  if (!is.null(var_list) & !is.vector(var_list, mode = "character")) {
    stop("Input for var_list is not a vector")
  }

  if (!is.numeric(n)) {
    stop("Input for n (bin size) not a numeric value")
  }

  # Separate the variables into numeric and categorical
  plot_list <- list(histograms = list(), bar_charts = list(), heatmap = list())
  numeric <- df |> dplyr::select_if(is.numeric)
  categorical <- df |> dplyr::select_if(purrr::negate(is.numeric))

  # Function with the default inputs

  if (is.null(var_list) == TRUE) {

    # Plots the histograms of numeric variables

    for (i in names(numeric)) {
      plot <- ggplot2::ggplot(numeric, ggplot2::aes_string(x = i)) +
        ggplot2::geom_histogram(
          color = "white",
          fill = "blue",
          bins = n
        ) +
        ggplot2::ggtitle(paste0("Histogram for variable: ", i))
      print(plot)
      plot_list$histograms <- append(plot_list$histograms, plot)
    }

    # Plots the bar charts of categorical variables

    for (i in names(categorical)) {
      plot <- ggplot2::ggplot(categorical) +
        ggplot2::aes(forcats::fct_infreq((!!dplyr::sym(categorical[, i] |>
          names())))) +
        ggplot2::geom_bar(
          stat = "count",
          fill = "#FF6666"
        ) +
        ggplot2::xlab(i) +
        ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90)) +
        ggplot2::ggtitle(paste0("Bar Chart for variable: ", i))
      plot_list$bar_charts <- append(plot_list$bar_charts, plot)
      print(plot)
    }

    # Plots a heatmap of numeric variables

    if (is.null(numeric) == FALSE) {
      plot <- GGally::ggcorr(numeric,
        label = TRUE,
        label_size = 4,
        label_round = 2,
        label_alpha = TRUE
      ) +
        ggplot2::ggtitle("Heatmap of numeric variables")
      plot_list$heatmap <- append(plot_list$heatmap, plot)
      print(plot)
    }
  }

  # Function with the custom inputs

  else if (is.null(var_list) == FALSE) {
    heat_map_list <- c()
    for (i in var_list) {
      if (i %in% names(df) == FALSE) {
        stop("Some variable names in var_list do not exist in df")
      }

      # Plots the histograms of the custom numeric variables

      if (i %in% colnames(numeric)) {
        heat_map_list <- append(heat_map_list, i)
        plot <- ggplot2::ggplot(numeric, ggplot2::aes_string(x = i)) +
          ggplot2::geom_histogram(
            color = "white",
            fill = "blue",
            bins = n
          ) +
          ggplot2::ggtitle(paste0("Histogram for variable: ", i))
        plot_list$histograms <- append(plot_list$histograms, plot)
        print(plot)
      }

      # Plots the bar charts of custom categorical variables

      if (i %in% colnames(categorical)) {
        plot <- ggplot2::ggplot(categorical) +
          ggplot2::aes(forcats::fct_infreq((!!dplyr::sym(categorical[, i] |>
            names())))) +
          ggplot2::geom_bar(
            stat = "count",
            fill = "#FF6666"
          ) +
          ggplot2::xlab(i) +
          ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90)) +
          ggplot2::ggtitle(paste0("Bar Chart for variable: ", i))
        plot_list$bar_charts <- append(plot_list$bar_charts, plot)
        print(plot)
      }
    }

    # Plots a heatmap of custom numeric variables
    heat_map_custom <- subset(numeric, select = heat_map_list)

    if (length(heat_map_list) > 1) {
      plot <- GGally::ggcorr(heat_map_custom,
        label = TRUE,
        label_size = 4,
        label_round = 2,
        label_alpha = TRUE
      ) +
        ggplot2::ggtitle("Heatmap of numeric variables")
      plot_list$heatmap <- append(plot_list$heatmap, plot)
      print(plot)
    }
  }
  invisible(plot_list)
}
