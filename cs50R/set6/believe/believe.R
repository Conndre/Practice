# In believe.R, turn to a large language model like ChatGPT or cs50.ai to write your function for you.
# check if the test cases cover all possible scenarios the function might handle.
# If the function does not pass all test cases, modify the implementation until it does.
factorial_function <- function(n) {
  if (n < 0) {
    stop("Input must be a non-negative integer.")
  }
  if (n == 0) {
    return(1)
  }
  result <- 1
  for (i in 1:n) {
    result <- result * i
  }
  return(result)
}

