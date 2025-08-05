
# Function to add bacteria to a specific species count
add_bacteria <- function(species, additional_count, bacteria_data) {
  if(species %in% bacteria_data$Species) {
    bacteria_data$Count[bacteria_data$Species == species] <-
      bacteria_data$Count[bacteria_data$Species == species] + additional_count
  }
  return(bacteria_data)
}

