## Assignment 3 for Coursera Programming R course.
##
## Two companion function to pass the inverse of a matrix into the local
## cache, and be able to recall it (without recalculation) when requested.
## 
## Variables:
##              x is the data, the matrix whose inverse needs to be calculated
##              m is the inverse matrix, i.e. the answer
##
## First function, mackeCacheMatrix.
##
## Is a list containing four functions:
##
##      1. set the value of the matrix
##      2. get the value of the matrix
##      3. set the inverse of the matrix
##      4. get the inverse of the matrix
##
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL                       ## initialise the answer matrix m as NULL
        set <-function(y){              ## Never actually called in the CacheInverse
                                        ## but if it was (by a different function)
                                        ## it would return a different value being
                                        ## cached, and set as y.
                                      
                x <<- y
                m <<- NULL
        }
        get <- function () {            ## Added curly braces (which are not needed as per original)
                                        ## to keep things consistent.
                                        ## when get is called (as per x$get()), it returns the matrix
                x                       ## value (i.e. answer)
        }                                
        setinverse <- function(solve) { ## Added more curly braces. Defines what function 
                m<<- solve              ## is to be called and makes it universally available.
        }
        getinverse <- function() {      ## Returns what function has been set previously by
                m                       ## setinverse.
        }
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
        
}

## Function below uses three of the listed functions above. It firsts pulls the cached answer
## and if it isn't empty, returns the value and the function exits. If the cache is empty (i.e. NULL)
## then it has to do some work. First it pulls the data (i.e. the matrix whose inverse needs to be calculated)
## and assigns it to data.

cacheinverse <- function(x, ...){
        m <- x$getinverse()                             ## pull the cached the answer
        if(!is.null(m)){                                ## if returned value isn't NULL, it must contain the answer
                message("getting cached inverse")       ## 
                return(m)                               ## return that value and exit function.
        }
        data <- x$get()                                 ## if we did get a NULL answer, better calculate the inverse
                                                        ## to the source matrix values and assigned to data variable.
        m<-solve(data, ...)                             ## Pass the source matrix to the matrix inverse function and
                                                        ## assign the answer to variable m.
        x$setinverse(m)                                 ## Return the value to the calling function
                                                        ## which then makes it universally available.
}




