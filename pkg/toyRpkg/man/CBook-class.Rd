\name{CBook-class}
\Rdversion{1.1}
\docType{class}
\alias{CBook-class}
\alias{bookTitle,CBook-method}
\alias{coerce,CBook,list-method}
\alias{show,CBook-method}
\alias{title<-,CBook-method}

\title{Class \code{"CBook"}}
\description{
A simple demonstration of how to write a S4 class. 
%%  ~~ A concise (1-5 lines) description of what the class is. ~~
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("CBook", ...)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{title}:}{Object of class \code{"character"} ~~ }
    \item{\code{author}:}{Object of class \code{"character"} ~~ }
    \item{\code{year}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{bookTitle}{\code{signature(object = "CBook")}: ... }
    \item{coerce}{\code{signature(from = "CBook", to = "list")}: ... }
    \item{show}{\code{signature(object = "CBook")}: ... }
    \item{title<-}{\code{signature(x = "CBook")}: ... }
	 }
}
\references{
%%  ~~put references to the literature/web site here~~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("CBook")
b1 <- CBook("C pgm", "Auther Lee", 1998); 
bt <- bookTitle(b1); 
str(b1) 
print(bt) 
title(b1) <- "Cpp pgm" 
str(b1) 
print(as(b1, "list")) 
show(b1) 
}
\keyword{classes}
