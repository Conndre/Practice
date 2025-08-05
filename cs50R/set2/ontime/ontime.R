# Read the data
bus_data <- read.csv("bus.csv")
rail_data <- read.csv("rail.csv")

# Combine bus and rail data into one data frame
services <- rbind(bus_data, rail_data)

# Get valid route names (standardize to lowercase to handle case sensitivity)
valid_routes <- tolower(unique(services$route))

# Start a loop to prompt for valid input
valid_input <- FALSE

while (!valid_input) {
  route_input <- tolower(trimws(readline("Enter the route: ")))

  # Check if the route input is valid
  if (route_input %in% valid_routes) {
    valid_input <- TRUE
  } else {
    cat("Invalid route!\n")
  }
}

# Filter the data for the selected route
route_data <- services[which(tolower(services$route) == route_input), ]

# Calculate the average reliability for peak hours
peak_data <- route_data[route_data$peak == "PEAK", ]
peak_reliability <- mean((peak_data$numerator / peak_data$denominator) * 100, na.rm = TRUE)

# Calculate the average reliability for off-peak hours
off_peak_data <- route_data[route_data$peak == "OFF_PEAK", ]
off_peak_reliability <- mean((off_peak_data$numerator / off_peak_data$denominator) * 100, na.rm = TRUE)

# Round the reliability values to the nearest whole number
peak_reliability <- round(peak_reliability)
off_peak_reliability <- round(off_peak_reliability)

# Use paste() to create the output and cat() to print
cat("On time", paste0(peak_reliability, "%"), "of the time during peak hours.\n")
cat("On time", paste0(off_peak_reliability, "%"), "of the time during off-peak hours.\n")

# Test with source("ontime.R") enter the route: Blue