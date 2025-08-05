# Function to calculate the yearly growth rate of visitors
calculate_growth_rate <- function(years, visitors) {
  # TODO: Calculate yearly growth of visitors
  # Calculate the difference in visitors from the first to the last year
  visitor_difference <- visitors[length(visitors)] - visitors[1]

  # Calculate the difference in years (from first year to last year)
  year_difference <- years[length(years)] - years[1]

  # Calculate and return the average yearly growth rate
  growth_rate <- visitor_difference / year_difference
  return(growth_rate)
}

# Function to predict the number of visitors in a given year
predict_visitors <- function(years, visitors, year) {
  # TODO: Predict visitors in the given year
  # Calculate the growth rate using the helper function
  growth_rate <- calculate_growth_rate(years, visitors)

  # Use the most recent data to predict visitors in the target year
  latest_year <- years[length(years)]
  latest_visitors <- visitors[length(visitors)]

  # Predict the visitors for the target year
  predicted_visitors <- latest_visitors + growth_rate * (year - latest_year)

  return(predicted_visitors)
}

# Main script to read data and predict visitors
# Read data from the CSV file
visitors <- read.csv("visitors.csv")

# Prompt the user for a year
year <- as.integer(readline("Year: "))

# Call the function to predict visitors and print the result
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)

# Output the prediction
cat(paste0(predicted_visitors, " million visitors\n"))

# Test your program with source("carpet.R")