# call the C yaout function 
yarout <- function(x, y) {
    storage.mode(x) <- storage.mode(y) <- "double"
    .Call("yaout", x, y)
}




