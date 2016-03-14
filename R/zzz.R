#' @import data.table
NULL

#' Optimization Snippets for R
#'
#' @section Package options:
#'
#' optimalr uses the following \code{\link{options}} to configure behaviour:
#'
#' \itemize{
#'   \item \code{digits}: number of digits to print
#'   \item \code{expressions}: a limit on the number of nested exp to eva
#'   \item \code{max.print}: max into to print
#' }
#' @docType package
#' @name optimalr
NULL

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.optimalr <- list(digits = 10,
                      expressions = 1e4,
                      max.print = 1e4)
  toset <- names(op.optimalr) %in% names(op)
  if(any(toset)) options(op.optimalr[toset])
  
  return(invisible(NULL))
}

.onAttach <- function(libname, pkgname) {
  # Runs when attached to search() path such as by library() or require()
  if (interactive()) {
    packageStartupMessage('optimalr ', as.character(packageVersion("optimalr")),
                          '  For help type ?optimalr or https://github.com/sunsiyu/optimalr')
  }
}
