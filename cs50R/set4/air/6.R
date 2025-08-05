
# In 6.R, Summarize the data in the tibble to find the total emissions for each pollutant.
# Sort the pollutants from highest to lowest emissions.

# Load the tibble from the saved .RData file
load("air.RData")

# Summarize total emissions for each pollutant
air <- air %>%
  group_by(pollutant) %>%
  summarize(emissions = sum(emissions, na.rm = TRUE), .groups = "drop") %>%
  # Sort by total emissions, descending
  arrange(desc(emissions))

# Print the summary tibble to the console
print(air)

# Save the summarized tibble as 'air.RData'
save(air, file = "6.RData")

