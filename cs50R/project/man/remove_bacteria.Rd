\name{remove_bacteria}
\alias{remove_bacteria}
\title{Remove Bacteria from a Species Count}
\description{Remove a specified number of bacteria from the count of a given species, ensuring it doesn't go below zero.}
\usage{
remove_bacteria(species, removal_count, bacteria_data)
}
\arguments{
  \item{species}{The species from which bacteria will be removed.}
  \item{removal_count}{The number of bacteria to remove.}
  \item{bacteria_data}{A data frame containing species and counts.}
}
\value{
  A data frame with updated counts for the species.
}
\examples{
bacteria_data <- count_bacteria()
remove_bacteria("Lactobacillus", 200, bacteria_data)
