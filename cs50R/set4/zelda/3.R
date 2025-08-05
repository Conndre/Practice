# 3.RData contains tibble with original releases of each Zelda title

# Load the cleaned zelda tibble
load("zelda.RData")


# Find the first release(s) for each title
zelda <- zelda %>%
  group_by(title) %>%
  filter(year == min(year)) %>%
  ungroup() %>%
  arrange(year, title, system)  # Sort by year, title, and system

# Print the resulting tibble to verify
print(zelda)

# Save the first releases tibble as 'zelda' to the correct file
save(zelda, file = "3.RData")



