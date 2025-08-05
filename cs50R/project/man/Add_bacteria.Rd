\name{add_bacteria}
\alias{add_bacteria}
\title{Add Bacteria to a Species Count}
\description{Add a specified number of bacteria to the count of a given species.}
\usage{
add_bacteria(species, additional_count, bacteria_data)
}
\arguments{
  \item{species}{The species to which bacteria will be added.}
  \item{additional_count}{The number of bacteria to add.}
  \item{bacteria_data}{A data frame containing species and counts.}
}
\value{
  A data frame with updated counts for the species.
}
\examples{
bacteria_data <- count_bacteria()
add_bacteria("Escherichia coli", 100, bacteria_data)
}
