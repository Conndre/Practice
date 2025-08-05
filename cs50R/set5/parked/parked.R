
# Open and clean a lyrics file, splitting it into a vector of words.
# Convert this vector  into a data frame that includes each word and the number of times it appears.
# Visualize the data frame using the ggplot2 package.s.

# Load necessary libraries
library(tidyverse)   # for ggplot2, readr, dplyr, and stringr

# Function to process lyrics and visualize word frequency
process_lyrics <- function(lyrics_file) {

  # Read the lyrics file
  lyrics <- read_file(lyrics_file)

  # Clean the lyrics
  # Convert the text to lowercase, remove punctuation, and split into a vector of  words
  clean_lyrics <- lyrics %>%
    str_to_lower() %>%
    str_remove_all("[^a-z\\s]") %>%
    str_split("\\s+") %>%
    unlist()

  # Count the frequency of each word
  dataf <- data.frame(
    words = unique(words),
    count = as.integer(table(words))
  )
  dataf <- dataf %>% filter(count > 1)

  # Create the visualization
  plot <- ggplot(dataf, aes(x = words, y = count)) + geom_col()

  # Save the plot as a PNG file
  ggsave("lyrics.png", plot, width = 10, height = 6)

  # Print the plot to the screen
  print(plot)
}


# Example usage of the function
process_lyrics("lyrics/swift.txt")
