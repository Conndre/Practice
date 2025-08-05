# test-believe.R

# Load necessary library for testing
library(testthat)

# Source the believe.R file which contains the function to be tested
source("believe.R")

# Test cases for factorial function

# Test base case for 0
test_that("Factorial of 0 is 1", {
  expect_equal(factorial_function(0), 1)  # 0! = 1
})

# Test base case for 1
test_that("Factorial of 1 is 1", {
  expect_equal(factorial_function(1), 1)  # 1! = 1
})

# Test small numbers
test_that("Factorial of 2 is 2", {
  expect_equal(factorial_function(2), 2)  # 2! = 2
})

test_that("Factorial of 3 is 6", {
  expect_equal(factorial_function(3), 6)  # 3! = 6
})

test_that("Factorial of 4 is 24", {
  expect_equal(factorial_function(4), 24) # 4! = 24
})

test_that("Factorial of 5 is 120", {
  expect_equal(factorial_function(5), 120) # 5! = 120
})

# Test larger numbers
test_that("Factorial of 6 is 720", {
  expect_equal(factorial_function(6), 720) # 6! = 720
})

test_that("Factorial of 7 is 5040", {
  expect_equal(factorial_function(7), 5040) # 7! = 5040
})

# Test edge case
test_that("Factorial of negative number raises an error", {
  expect_error(factorial_function(-1))  # Should raise an error for negative input
})

#Test withsource("believe.R") and source("test-believe.R")
