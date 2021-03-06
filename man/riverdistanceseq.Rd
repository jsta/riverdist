% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apps_of_riverdistance.R
\name{riverdistanceseq}
\alias{riverdistanceseq}
\title{River Distance Between Sequential Observations}
\usage{
riverdistanceseq(unique, survey, seg, vert, rivers, logical = NULL,
  stopiferror = TRUE, algorithm = NULL)
}
\arguments{
\item{unique}{A vector of identifiers for each fish.}

\item{survey}{A vector of identifiers for each survey.  It is recommended to use a numeric or date format (see \link{as.Date}) to preserve survey order.}

\item{seg}{A vector of river locations (segment component).}

\item{vert}{A vector of river locations (vertex component).}

\item{rivers}{The river network object to use.}

\item{logical}{A boolean vector that can be used for subsetting.  If used,
\code{riverdistanceseq()} will only return pairwise distances in which a
specified condition is met.}

\item{stopiferror}{Whether or not to exit with an error if a route cannot be
found.  If this is set to \code{FALSE} and a route cannot be found,
the function will return \code{NA} in the appropriate entry.  Defaults to \code{TRUE}.  See \link{detectroute}.}

\item{algorithm}{Which route detection algorithm to use (\code{"Dijkstra"},
\code{"sequential"}, or \code{"segroutes"}).  If left as \code{NULL} (the
default), the function will automatically make a selection.  See
\link{detectroute} for more details.}
}
\value{
A data frame of distances (numeric), with rows defined by unique fish and columns defined by observation increment (1 to 2, 2 to 3, etc.)
}
\description{
Returns a matrix of distances traveled by unique fish, between
  sequential surveys.  A plotting method is also provided for the output; see \link{plotseq}
}
\note{
Building routes from the river mouth to each river network segment and/or distance lookup tables will
  greatly reduce computation time (see \link{buildsegroutes}).
}
\examples{
data(Gulk, fakefish)
riverdistanceseq(unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
     
seqbysurvey <- riverdistanceseq(unique=fakefish$fish.id, survey=fakefish$flight.date,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
seqbysurvey
plotseq(seqbysurvey)
}
\seealso{
\link{riverdistance}, \link{plotseq}
}
\author{
Matt Tyers
}
