# context("test-balance_points")

test_that("balance_points works for integer n", {

  input <- spatstat.random::rpoispp(lambda = 100)

  result <- balance_points(pattern = input, n = 110, verbose = FALSE)

  expect_equal(object = result$n, expected = 110)
})

test_that("balance_points works for ppp n", {

  input <- spatstat.random::rpoispp(lambda = 100)
  input_b <- spatstat.random::rpoispp(lambda = 100)

  result <- balance_points(pattern = input, n = input_b, verbose = FALSE)

  expect_equal(object = result$n, expected = input_b$n)
})

test_that("balance_points returns error", {

  input <- spatstat.random::rpoispp(lambda = 100)

  expect_error(object = balance_points(pattern = input, n = 50.5, verbose = FALSE),
               regexp = "n must be either integer or ppp.")
})

test_that("balance_points returns warning", {

  input <- spatstat.random::rpoispp(lambda = 100)

  expect_warning(object = balance_points(pattern = input, n = 20),
                 regexp = "Differences between pattern and n more than 0.33.")
})
