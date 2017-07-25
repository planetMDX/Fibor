library("fibor")

test_that("unacceptable input returns an error", {
  expect_error(fibonacci("a"))
  expect_error(fibonacci(-6))
  expect_error(fibonacci("abf"))
  expect_error(fibonacci(3.5))
})
test_that("first numbers are correct", {
  expect_equal(fibonacci(0), 0)
  expect_equal(fibonacci(1), c(0,1))
  expect_equal(fibonacci(2), c(0,1,1))
  expect_equal(fibonacci(3), c(0,1,1,2))
})
test_that("lenght or the List is correct", {
  expect_length(fibonacci(4), 5)
  expect_length(fibonacci(20), 21)
  expect_length(fibonacci(200), 201)
})
test_that("results fit with their predecessors", {
  expect_equal(fibonacci(8)[1:8], fibonacci(7))
  expect_equal(fibonacci(150)[1:150], fibonacci(149))
})
