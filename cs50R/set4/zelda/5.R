# 5.RData contains tibble with all original releases produced by more than 1 producer

# Load the cleaned zelda tibble
load("zelda.RData")

# Filter titles with more than one producer (assuming producers are separated by commas)
zelda <- zelda %>%
  filter(str_count(producers, ",") >= 1) %>%  # More than one producer
  group_by(title) %>%
  filter(year == min(year)) %>%  # First release(s)
  ungroup() %>%
  arrange(year, title, system)  # Sort by year, title, and system alphabetically

# Print the resulting tibble to verify the output
print(zelda)

# Save the updated tibble as 'zelda' in "5.RData"
save(zelda, file = "5.RData")