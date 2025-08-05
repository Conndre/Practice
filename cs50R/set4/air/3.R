# In 3.R, load the air tibble from air.RData
# Transform the tibble so that it only includes data for the county of your choice.

# Load the tibble
load("air.RData")

# Trim whitespace from county names
air <- air %>% mutate(county = str_trim(county))

# Filter for the specific county
air <- air %>% filter(county == "OR - Multnomah")

# Print the filtered tibble to the console
print(air)

# Save the filtered tibble
save(air, file = "3.RData")



