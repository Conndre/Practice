# In 7.R, load the air tibble from air.RData with load.
# Transform the tibble to find the total emissions of each pollutant from each of the level_1 source categories.
# Sort the rows first alphabetically by source name, then alphabetically by pollutant name.(level_1)

# Load the 'air' tibble from air.RData
load("air.RData")

# Summarize the total emissions for each pollutant from each source category (level_1)
air_summary_level1 <- air %>%
  # Group by source category (level_1) and pollutant
  group_by(level_1, pollutant) %>%
  # Summarize total emissions for each group
  summarize(emissions = sum(emissions, na.rm = TRUE), .groups = "drop") %>%
  # Rename level_1 to 'source' for clarity
  rename(source = level_1) %>%
  # Sort first by source (alphabetically), then by pollutant (alphabetically)
  arrange(source, pollutant)

# Save the summarized results back into 'air' to match the expected object name
air <- air_summary_level1

# Print the resulting tibble to check that it's correct
print(air)

# Save the summarized tibble as '7.RData' (with the name 'air')
save(air, file = "7.RData")

#:) .RData files exist
# air.RData contains tidy air tibble
# 2.RData contains air tibble sorted by emissions column
# 3.RData contains air tibble with only one county's data
# 4.RData contains air tibble with only one county's data, sorted by emissions column
# 5.RData contains air tibble with largest pollutant source for each county
# 6.RData contains air tibble with total emissions for each pollutant
# 7.RData contains air tibble with total emissions of each pollutant for each level 1 source