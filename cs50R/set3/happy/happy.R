# Function to calculate and display the happiness score for a given country
calculate_happiness_score <- function(country_name) {

  # List all CSV files in the directory
  years <- list.files(pattern = "\\.csv$")

  # Print the country name
  cat("Country:", country_name, "\n")

  # Iterate over each year's file
  for (year in years) {

    # Read the CSV file for the target year
    df <- read.csv(year)

    # Extract the year from the file name (remove .csv extension)
    year_num <- gsub("\\.csv$", "", year)

    # Check if the country is in the data for this year
    if (country_name %in% df$country) {

      # Get the row corresponding to the given country
      country_row <- df[df$country == country_name, ]

      # Calculate the happiness score (sum of relevant columns)
      happiness_score <- sum(country_row[, c("gdp", "support", "life_expectancy", "freedom", "generosity", "corruption", "residual")])

      # Print the result for this year, rounded to 2 decimal places
      cat(country_name, "(", year_num, "):", round(happiness_score, 2), "\n")
    } else {
      # If the country is not found in this year's data, print "unavailable"
      cat(country_name, "(", year_num, "): Data unavailable\n")
    }
  }
}

# Prompt the user for a country's name
country_name <- readline(prompt = "Country: ")

# Call the function to calculate the happiness score
calculate_happiness_score(country_name)

# Test with source("happy.R")

