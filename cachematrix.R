# This function returns the inverse of the user's input matrix. While calculating the inverse of user's matrix, 
# this function cached the inverse matrix for the later use. If the user's matrix is already cached, 
# It will just return the cached inverse matrix from memory without re-calculating it. If not, 
# it will calculate and cached it and return it

# makeCacheMatrix function takes one parameter which should be the user's input matrix and return the inverse of it

makeCacheMatrix <- function(x = matrix()) {
        inverseMatrix <- NULL
        set <- function(y) {
          x <<- y
          inverseMatrix <<- NULL
        }
        get <- function() x
        setInverseMatrix<- function(inverse) inverseMatrix <<-inverse
        getInverseMatrix <- function() inverseMatrix
         list(set = set, get = get,
                setInverseMatrix = setInverseMatrix,
                 getInverseMatrix = getInverseMatrix)
}


# This is the function where the process of inversion of user's input matrix happens. 
# If the inversion has already been calculated, then the cachesolve fucnton retrieves the inverse 
# from the cache without calculating it. If not calculated, it will calculate and saves into the cache 
# before returning inverse to the makecachmatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     inverseMatrix <- x$getInverseMatrix()
     if (!is.null(inverseMatrix)) {
          message("The matrix you are trying to calculate is already cached. Returning the cached inverse matrix")
     } else {
          inverseMatrix <- solve(x$get())
          x$setInverseMatrix(inverseMatrix)
     }
     inverseMatrix
}
