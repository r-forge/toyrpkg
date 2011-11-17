/*
 *  Copied from how to write R extension. 
 *  http://cran.r-project.org/doc/manuals/R-exts.html#Attributes
 */

/* 
 *   yaout <- function(x, y)
 *   {
 *       storage.mode(x) <- storage.mode(y) <- "double"
 *       .Call("out", x, y)
 *   }
**/

#include <R.h>
#include <Rinternals.h>

SEXP yaout(SEXP x, SEXP y) {
    R_len_t i, j, nx = length(x), ny = length(y);
    double tmp, *rx = REAL(x), *ry = REAL(y), *rans;
    SEXP ans;

    PROTECT(ans = allocMatrix(REALSXP, nx, ny));
    rans = REAL(ans);
    for(i = 0; i < nx; i++) {
        tmp = rx[i];
        for(j = 0; j < ny; j++)
            rans[i + nx * j] = tmp * ry[j];
    }
    UNPROTECT(1);
    return(ans);
}

/* If we want to let the C library (***.so) be dynamically loaded, 
 * we could 
 * 1) write hook functions such as .onLoad() as described in 
 *    http://cran.r-project.org/doc/manuals/R-exts.html#Load-hooks
 * 2) write something in NAMESPACE file 
 *
 */ 

