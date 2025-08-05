# In 4.R, load the air tibble from air.RData with load.
# Transform the tibble so that it only includes data for the chosen county
# and sorts  data by  emissions column, desc

# Load the tibble
load("air.RData")

# Filter for the specific county and sort by emissions
air <- air %>%
  filter(county == "OR - Multnomah") %>%
  arrange(desc(emissions))

# Print the sorted tibble to the console
print(air)

# Save the sorted tibble
save(air, file = "4.RData")



