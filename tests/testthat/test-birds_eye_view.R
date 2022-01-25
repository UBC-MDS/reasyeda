test_that("Failed", {

  # Load in a testing dataframe
  df <- palmerpenguins::penguins |>
    dplyr::select(c("bill_length_mm", "body_mass_g", "island"))

  # Check exception tests
  expect_error(birds_eye_view(3))
  expect_error(birds_eye_view(df, var_list = 1))
  expect_error(birds_eye_view(df, n = "word"))
  expect_error(birds_eye_view(df, var_list = c("not_a_variable")))

  # Check plots with default inputs
  plots <- birds_eye_view(df)

  # Test histograms
  expect_equal(plots$histograms$labels$x, "bill_length_mm")
  expect_equal(plots$histograms$labels$title, "Histogram for variable: bill_length_mm")
  expect_equal(typeof(plots$histograms$theme), "list")

  # Test bar_charts
  expect_equal(plots$bar_charts$labels$x, "island")
  expect_equal(plots$bar_charts$labels$title, "Bar Chart for variable: island")
  expect_equal(typeof(plots$bar_charts$theme), "list")

  # Test heatmap
  expect_equal(plots$heatmap$labels$title, "Heatmap of numeric variables")
  expect_equal(plots$heatmap$labels$fill, "coefficient")
  expect_equal(plots$heatmap$labels$label, "label")
  expect_equal(typeof(plots$heatmap$theme), "list")

  # Check plots with custom inputs
  plots2 <- birds_eye_view(df, n = 15, var_list = c("bill_length_mm", "body_mass_g", "island"))

  # Test histograms
  expect_equal(plots2$histograms$labels$x, "bill_length_mm")
  expect_equal(plots2$histograms$labels$title, "Histogram for variable: bill_length_mm")
  expect_equal(typeof(plots2$histograms$theme), "list")

  # Test bar_charts
  expect_equal(plots2$bar_charts$labels$x, "island")
  expect_equal(plots2$bar_charts$labels$title, "Bar Chart for variable: island")
  expect_equal(typeof(plots2$bar_charts$theme), "list")

  # Test heatmap
  expect_equal(plots2$heatmap$labels$title, "Heatmap of numeric variables")
  expect_equal(plots2$heatmap$labels$fill, "coefficient")
  expect_equal(plots2$heatmap$labels$label, "label")
  expect_equal(typeof(plots2$heatmap$theme), "list")
})
