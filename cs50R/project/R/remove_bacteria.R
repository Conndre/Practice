
# Function to remove bacteria from a specific species count
remove_bacteria <- function(species, removal_count, bacteria_data) {
  if(species %in% bacteria_data$Species) {
    bacteria_data$Count[bacteria_data$Species == species] <-
      max(0, bacteria_data$Count[bacteria_data$Species == species] - removal_count)
  }
  return(bacteria_data)
}
