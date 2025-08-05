# Load necessary libraries
library(stringr)
library(testthat)

# Standard Strings: checks for the length of basic strings, whitespace and punctuation
test_that("str_length works with standard strings", {
  expect_equal(str_length("abc"), 3)                   # Basic test
  expect_equal(str_length(" "), 1)                      # Whitespace
  expect_equal(str_length("hello world!"), 12)          # Sentence with punctuation
})

# Special Characters: tests the function with emoji and special characters.
test_that("str_length handles special characters", {
  expect_equal(str_length("😊"), 1)                     # Emoji
  expect_equal(str_length("!@#$%^&*()"), 10)            # Special characters
})

# NA and Inf Values: checks how str_length handles NA, Inf, and -Inf inputs.
test_that("str_length handles NA values correctly", {
  expect_equal(str_length(NA), NA_integer_)              # NA input
})

test_that("str_length handles Inf and -Inf values correctly", {
  expect_equal(str_length("Inf"), 3)                     # String "Inf"
  expect_equal(str_length("-Inf"), 4)                    # String "-Inf"
})

# Vector Inputs: process a vector of strings and returns a vector of corresponding lengths.
test_that("str_length works with vector inputs", {
  expect_equal(str_length(c("foo", "bar", "baz")), c(3, 3, 3))  # Vector of strings
  expect_equal(str_length(c("a", "bb", "ccc")), c(1, 2, 3))      # Different lengths
})

# Data Frame Inputs: should throw an error
test_that("str_length handles data frame inputs correctly", {
  df <- data.frame(x = c("a", "ab", "abc"))
  expect_warning(str_length(df), "argument is not an atomic vector; coercing")
})

# Empty Strings: verifies that the function returns 0 for an empty string.
test_that("str_length handles empty strings", {
  expect_equal(str_length(""), 0)                          # Empty string
})

# test withsource("test-str_length.R")