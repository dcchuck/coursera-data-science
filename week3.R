# Loop Funtions

# lappply

# You have a list of objects and you want to loop over that list and apply a function to every element of that list

# function function (X, FUN, ...)

# If X is not a list, it will be coerced to a  list

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

# list -> list (it's always a list)

x <- 1:4
lapply(x, runif)

# 1
# 12
# 123
# 1234

# sapply <- if all element are of the same "shape", returns a vector

sapply(x, mean) # returns a vector, otherwise it's a list

#

x <- matrix(rnorm(200), 20, 10)

apply(x, 2, mean)

# returns a vector with means of each column - > R x C matrix.

# rowSums, rowMeans, colSums, colMeans -> Basically the apply function BUT optimized

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)

# mapply 



