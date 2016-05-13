## Functions Explanation
# This two functions helps create a special matrix with the possibility to cache its inverse for further computation.

## makeCacheMatrix()
# This function receives a matrix and build a list with the original matrix content ("get()"),
# a function to insert inside the list the inverse of the matrix ("setsolve()") and
# the inverse matrix ("getsolve()").

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  #set <- function(y) {
    #x <<- y
    #m <<- NULL
  #}  
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## cacheSolve()
# This function receives the special matrix created by makeCacheMatrix() and check if
# it contains its inverse, if not, it calculated and store the result inside the original
# variable.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data)
  x$setsolve(s)
  s
}