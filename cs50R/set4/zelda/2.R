# 2.RData contains tibble summarizing number of Zelda releases in each year

# Load the cleaned zelda tibble
load("zelda.RData")

# Summarize the number of releases per year
zelda <- zelda %>%
  group_by(year) %>%
  summarise(releases = n()) %>%
  arrange(desc(releases))

# Print the resulting tibble to verify the output
print(zelda)

# Save the summarized tibble with the correct name
save(zelda, file = "2.RData")
