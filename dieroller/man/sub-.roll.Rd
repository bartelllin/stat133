% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rolldie.R
\name{[.roll}
\alias{[.roll}
\title{extraction method}
\usage{
\method{[}{roll}(x, i)
}
\arguments{
\item{x}{roll object}

\item{i}{index}
}
\value{
value at index i
}
\description{
extracts the value of a given roll
}
\examples{
fair <- die()
rollfair <- roll(fair, 50)
rollfair[35]
}
