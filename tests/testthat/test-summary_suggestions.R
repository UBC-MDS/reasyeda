toy_data = tibble::tibble(
  "income"= c(5, 8, 10, 12, 17, 19),
  "house_size"= c(700, 600, 900, 1000, 1200, 1500),
  "views"= c("mountain", "mountain", "sea", "mountain", "urban", "forest"),
  "test"= c("a", "b", "e", "c", "d", "b"),
  "price"= c(65, 50, 80, 98.5, 112, 133),
  "doctor_visits"= c(6, 8, 4, 5, 3, 2),
)
df = data.frame(toy_data)

test_that("Incorrect output for the function", {

  # check output type
  expect_equal(typeof(summary_suggestions(df)), "list")

  # Check inputs
  expect_error(summary_suggestions(3))
  expect_error(summary_suggestions(df, threshold = 10.4))

})

test_that("Incorrect output for first element", {

  # check first element
  expect_equal(typeof(summary_suggestions(df)[[1]]), "list")
  expect_equal(nrow(summary_suggestions(df)[[1]]), 14)
  expect_equal(ncol(summary_suggestions(df)[[1]]), 4)

})

test_that("Incorrect output for second element", {

  # check second element
  expect_equal(typeof(summary_suggestions(df)[[2]]), "list")
  expect_equal(summary_suggestions(df)[[2]][[1]][[1]], "views")
  expect_equal(summary_suggestions(df)[[2]][[2]][[1]], "test")


})

test_that("Incorrect output for third element", {

  # check third element
  expect_equal(typeof(summary_suggestions(df)[[3]]), "list")
  expect_equal(ncol(summary_suggestions(df)[[3]]), 3)
  expect_equal(nrow(summary_suggestions(df)[[3]]), 1)


})
