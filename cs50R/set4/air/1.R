# In 1.R , read into a tibble called , renaming and selecting the columns you need.
# Save the resulting air tibble, using save, in a file called air.RData.
# You’ll use this tibble in the next .R files.

library(tidyverse)
# Read CSV into a tibble
air <- read_csv("air.csv") %>%

  rename(
    state = State,
    county = `State-County`,
    pollutant = POLLUTANT,
    emissions = `Emissions (Tons)`,
    level_1 = `SCC LEVEL 1`,
    level_2 = `SCC LEVEL 2`,
    level_3 = `SCC LEVEL 3`,
    level_4 = `SCC LEVEL 4`
  ) %>%
  select(state, county, pollutant, emissions, level_1, level_2, level_3, level_4)

# Print air
print(air)
# Save the tibble
save(air, file = "air.RData")

