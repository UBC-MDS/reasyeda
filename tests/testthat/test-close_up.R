# unit tests
test_that("List should be returned", {
  toy_data <- data.frame(
    income = c(5, 8, 10, 12, 17, 19),
    house_size = c(700, 600, 900, 1000, 1200, 1500),
    views = c("mountain", "river", "sea", "mountain", "urban", "forest"),
    price = c(65, 50, 80, 98.5, 112, 133),
    doctor_visits = c(6, 8, 4, 5, 3, 2)
  )
  chart_1 <- close_up(toy_data)
  expect_type(chart_1, "list")
})

test_that("One chart should be returned", {
  toy_data <- data.frame(
    income = c(5, 8, 10, 12, 17, 19),
    house_size = c(700, 600, 900, 1000, 1200, 1500),
    views = c("mountain", "river", "sea", "mountain", "urban", "forest"),
    price = c(65, 50, 80, 98.5, 112, 133),
    doctor_visits = c(6, 8, 4, 5, 3, 2)
  )
  chart_1 <- close_up(toy_data)
  expect_equal(length(chart_1$layers), 1)
})

test_that("Four layers of chart should be returned", {
  toy_data <- data.frame(
    income = c(5, 8, 10, 12, 17, 19),
    house_size = c(700, 600, 900, 1000, 1200, 1500),
    views = c("mountain", "river", "sea", "mountain", "urban", "forest"),
    price = c(65, 50, 80, 98.5, 112, 133),
    doctor_visits = c(6, 8, 4, 5, 3, 2)
  )
  chart_4 <- close_up(toy_data, n = 4)
  expect_equal(length(chart_4$layers), 4)
})

# error tests
test_that("Test for input as data.frame works", {
  expect_error(close_up(toy_data[[1]]))  # input a wrong type as vector
})

test_that("Test for n as interger works", {
  expect_error(close_up(toy_data, n = 1.2))  # input wrong type as double
})

test_that("Test for n as interger works", {
  expect_error(close_up(toy_data, n = 18))  # input exceeds the max possible value
})
