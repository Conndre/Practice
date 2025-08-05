# 4.RData contains tibble with all original releases produced by Shigeru Miyamoto

# Load the tidy tibble from zelda.RData
load("zelda.RData")

# Filter for titles produced by Shigeru Miyamoto
zelda <- zelda %>%
  filter(str_detect(producers, "Shigeru Miyamoto")) %>%  # Filter for Miyamoto as producer
  group_by(title) %>%
  filter(year == min(year)) %>%  # Only the first release for each title
  ungroup() %>%
  arrange(year, title, system)  # Sort by year, title, and system

# Print the resulting tibble to verify
print(zelda)

# Save the resulting tibble to "4.RData" as 'zelda'
save(zelda, file = "4.RData")




