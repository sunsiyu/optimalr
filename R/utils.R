sourcedir <- function(path, trace = TRUE, ...) 
{
  for (n in list.files(path, pattern = ".R")) {
    if(trace) cat(nm,":")
    source(file.path(path, nm), ...)
    if(trace) cat("\n")
  }
}
