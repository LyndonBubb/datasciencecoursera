## Programming Assignment 2 lexical - R Programming

## To cache the inverse of a matrix

## Matrix inversion is usually a costly computation especially when working
## with large data sets and there may be benefit to caching the inverse 
## of a matrix rather than compute it repeatedly.
## Below are a set of functions that are used to create a special object
## to store a matrix and cache its inverse 

## makeCacheMatrix 

## makeCacheMatrix creates a list containing a function to
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of inverse of the matrix
## 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
## inv will store the cached inverse matrix initially set to NULL
  inv <- NULL
## Set function - Sets the matrix itself but not the inverse
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
## Get function
  get <- function() x
## Manually set the inverse
  setinverse <- function(inverse) inv <<- inverse
## Get the inverse
  getinverse <- function() inv
## Return the matrix with our newly defined functions
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve:

## This function computes the inverse of the makeCacheMatrix

## If cacheSolve is run again on the same special matrix, then the 
## pre-computed result will be returned (assuming the matrix has not
## changed )and thus avoids recomputation.  
## An informative message will show in the command prompt when the 
## pre-computed result is returned.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
## Get the current state of the inverse and check if has been 
## already computed
    inv <- x$getinverse()
## If it has...
    if(!is.null(inv)) {
## then it will simply return the computed inverse
      message("Getting cached matrix")
      return(inv)
    }
## If it hasn't...
## then it will have to get the matrix itself
    data <- x$get()
## goes and finds the inverse
    inv <- solve(data, ...)
## this will cache this result in the object
    x$setinverse(inv)
## the you can return this new result
    inv    
  }
