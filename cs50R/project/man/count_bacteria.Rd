\name{count_bacteria}
\alias{count_bacteria}
\title{Count Bacteria in a Microbiome Sample}
\description{Simulate counting bacteria of various species in a microbiome sample.}
\usage{
count_bacteria(species = c("Escherichia coli", "Lactobacillus", "Bacteroides"),
               count = c(500, 1200, 300))
}
\arguments{
  \item{species}{A vector of species names.}
  \item{count}{A vector of counts for each species.}
}
\value{
  A data frame with two columns: `Species` and `Count`.
}
\examples{
count_bacteria()
}
