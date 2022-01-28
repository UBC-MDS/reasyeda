
test_that("Testing if a list of outliers is produced", {
  test_df <- data.frame(
    a=c(1,1,1,1,1,1,1,1,1,1,1e14),
    b=c(NA,'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i','j')
  )
  expect_type(clean_up(test_df), "list")
})

test_that("Testing if dataframe is returned", {
  test_df <- data.frame(
    a=c(1,1,1,1,1,1,1,1,1,1,1e14),
    b=c(NA,'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i','j')
  )
  expect_s3_class(clean_up(test_df), "data.frame")
})

test_that("Testing for correct outlier detected", {
  test_df <- data.frame(
    a=c(1,1,1,1,1,1,1,1,1,1,1e14),
    b=c(NA,'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i','j')
  )
  expect_snapshot(clean_up(test_df), 1e+14)
})

test_that("Checking errors in input", {
  test_list <- list(1,1,1,1,1,1,1,1,1,1,1e14)
  expect_error(clean_up(test_list))
})
