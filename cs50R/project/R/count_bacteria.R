
# Function to count bacteria of different species
count_bacteria <- function(species = c("Escherichia coli", "Lactobacillus", "Bacteroides"),
                           count = c(500, 1200, 300)) {
  data.frame(Species = species, Count = count)}
