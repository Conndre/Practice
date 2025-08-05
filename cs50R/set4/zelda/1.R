# In 1.R In 1.R, organize the data in zelda.csv to get it ready for analysis.
# Save the cleaned data as a tibble named zelda in zelda.RData.

# Load required libraries
if (!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)

# Read the raw data from the CSV file
raw_data <- read_csv("zelda.csv")

# Check the first few rows of raw data to verify column names and structure
head(raw_data)

# Process the raw data into a tidy tibble
zelda <- raw_data %>%
  # Separate the 'release' column into 'year' and 'system'
  separate(release, into = c("year", "system"), sep = " - ", convert = TRUE) %>%
  # Pivot the data to widen the columns based on the 'role' column
  pivot_wider(names_from = role, values_from = names) %>%
  # Ensure the correct column names
  rename(
    title = title,          # title stays as it is
    year = year,            # year stays as it is
    system = system,        # system stays as it is
    directors = Directors,  # rename to match specification
    producers = Producers,  # rename to match specification
    designers = Designers,  # rename to match specification
    programmers = Programmers,  # rename to match specification
    writers = Writers,      # rename to match specification
    composers = Composers,  # rename to match specification
    artists = Artists       # rename to match specification
  ) %>%
  # Arrange the data by year, title, and system
  arrange(year, title, system)

# Print the resulting tibble to verify
print(zelda)

# Save the tidy tibble to "zelda.RData"
save(zelda, file = "zelda.RData")




