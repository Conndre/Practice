# In 5.R, load the air tibble from air.RData with load. Transform the tibble to include a single row with the highest value in the emissions column for each county.

# Load the tibble
load("air.RData")

# Find the largest source for each county
air <- air %>%
  group_by(county) %>%
  slice_max(emissions, n = 1) %>%
  ungroup()

# Print the resulting tibble to the console
print(air)

# Save the resulting tibble
save(air, file = "5.RData")


