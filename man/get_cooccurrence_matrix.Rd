\name{get_cooccurrence_matrix}
\alias{get_cooccurrence_matrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get Topic Cooccurrence Matrix
}
\description{
Given a document-topic matrix, the function returns a topic cooccurrence matrix (also called an adjacency matrix).
}
\usage{
get_cooccurrence_matrix(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A dataframe representing a document-topic matrix. Each row \emph{i} and column \emph{j} in the matrix should represent a document and topic, respectively. Each element \emph{x[i,j]} can be either 1 if document \emph{i} contains topic \emph{j}, or 0 otherwise.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A dataframe representing the topic cooccurrence matrix
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Chinmay Kakatkar
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
library(coocmat)
#simulate some data (rows are documents, cols are topics)
df <- data.frame(t(matrix(c(c(1,0,0,1,0,1),
                            c(0,1,1,1,0,1),
                            c(1,0,0,0,0,0),
                            c(0,0,1,1,0,1),
                            c(1,1,1,0,0,0)),
                          ncol = 5, nrow = 6)))

#derive topic cooccurrence matrix
cooccurrence_matrix <- get_cooccurrence_matrix(df)

#get list of topics
names(cooccurrence_matrix)

#print how many times topic "2" cooccurred with topic "3"
print(cooccurrence_matrix["2","3"])

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
