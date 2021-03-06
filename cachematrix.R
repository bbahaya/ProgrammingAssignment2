## This a pair of functions that can cache the inverse of a matrix.
## 

##  This function creates a special "matrix" object whose inverse will be cached.

makeCacheMatrix <- function(x = matrix()) {
        inv<-NULL
        set<-function(y) {
                x<<-y
                inv<<-NULL
        }
        get<-function() x
        
        setinverse<-function(inverse) inv<<-inverse
        getinverse<-function() inv
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
# If the inverse has already been calculated then cacheSolve will retrieve the inverse from above.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv<-x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data<-x$get()
        inv<-solve(data, ...)
        x$setinverse(inv)
        inv
}
