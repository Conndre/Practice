# Prompt user for CSV filename
filename <- readline(prompt = "Enter CSV file to analyze: ")

# Load the CSV file into a data frame
pit_stops <- read.csv(filename)

# Total number of pit stops (number of rows in the data frame)
total_pit_stops <- nrow(pit_stops)

# Duration of the shortest pit stop (minimum time in the 'time' column)
shortest_pit_stop <- min(pit_stops$time)

# Duration of the longest pit stop (maximum time in the 'time' column)
longest_pit_stop <- max(pit_stops$time)

# Total time spent on pit stops (sum of all 'time' values)
total_time_spent <- sum(pit_stops$time)

# Print the results using paste to format the output
print(paste("Total number of pit stops:", total_pit_stops))
print(paste("Shortest pit stop duration:", shortest_pit_stop, "seconds"))
print(paste("Longest pit stop duration:", longest_pit_stop, "seconds"))
print(paste("Total time spent on pit stops:", total_time_spent, "seconds"))

# To test: run your program with source("pitstop.R") and  Type miami.csv
