# A S4 class defining books 
# This is a demonstration of a usage of S4 class 

setClass(Class = "CBook", 
         representation = representation(
             title = "character", 
             author = "character", 
             year = "numeric"), 
         validity = function(object) {
             v <- is.null(object@title) & is.null(object@author) & is.null(object@year)  
             return(!v) 
         }); 

CBook <- function(ptitle, pauthor, pyear) {
    book <- new("CBook", title = ptitle, author = pauthor, year = pyear)  
    return(book) 
} 

setGeneric("bookTitle", function(object) standardGeneric("bookTitle")) 
setMethod("bookTitle", "CBook", function(object) object@title)


## reset the validity check function 
setValidity("CBook", 
            function(object) {
               v <- is.null(object@title) & is.null(object@author) & is.null(object@year)  
               if (object@year > 2011)  return(FALSE) 
               return(!v) 
            }); 


## define a replace function 
setGeneric("title<-", function(x, value) standardGeneric("title<-"))
setReplaceMethod("title", "CBook", 
                function(x, value) { x@title <- value; validObject(x); x})


## defining a coercion method
setAs("CBook", "list", 
      function(from) list(title = from@title, author = from@author, year = from@year))  

setMethod("show", "CBook", function(object) { 
    cat("title: ", object@title, "\n", 
        "author: ", object@author, "\n", 
        "year: ",   object@year, "\n", sep = '')})  
 

## example code 

b1 <- CBook("C pgm", "Auther Lee", 1998); 
bt <- bookTitle(b1); 
str(b1) 
print(bt) 
title(b1) <- "Cpp pgm" 
str(b1) 
print(as(b1, "list")) 
show(b1) 

 
