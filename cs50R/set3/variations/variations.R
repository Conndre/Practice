# Function to generate a random character
random_character <- function() {
  # Return one random letter
  sample(letters, 1)
}

# Function to print a sequence of random characters
print_sequence <- function(length) {
  # Print a random sequence of specified length
  for (i in 1:length) {
    cat(random_character())
    Sys.sleep(0.25)  # Wait for 0.25 seconds between each character
  }
  cat("\n")  # Print a newline at the end of the sequence
}

# Test the functions with a sequence length of 20
print_sequence(20)

# test your program with source("variations.R")