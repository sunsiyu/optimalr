getdist1 <- function(x, y)
{
  stopifnot(is.vector(x) && is.vector(y))
  return(sqrt(sum((x-y)^2)))
}

getdist2 <- function(x, y)
{
  stopifnot(is.vector(x) && is.vector(y))
  return(sqrt(crossprod(x-y)))
}

getdist3 <- function(x, y)
{
  stopifnot(is.vector(x) && is.vector(y))
  m <- matrix(c(x,y), byrow=T, nrow = 2)
  return(dist(m))
}