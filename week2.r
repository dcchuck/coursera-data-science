# if

if (3 > 2) {
  print("well...")
} else if (TRUE) {
  print("ok.")
} else {
  print("this looks like javascript!")
}

x <- 4

y <- if (x > 3) {
  10
} else {
  0
}

# for loops

for (i in 1:10) {
  print(i)
}

k <- c("a", "b", "c", "d")

for(i in seq_along(k)) {
  print(x[i])
}

for(letter in k) {
  print(letter)
}

# curly braces are optional if it's just a one line thing. This guy likes the {} and so do I.
# Nest these all you want but nested for loops "stink".

count <- 0

while(count < 10) {
  print(count)
  count <- count + 1
}

# Logical operators allow you to create compound conditionals
#   Conditions are evaluated LEFT TO RIGHT (first() && second())

# repeat {} - repeat until you call break.
# next in a for loop will let you go on to the next item

recursiveAddition <- function(x) {
  if ( x == 0 ){
    0
  } else {
    x + recursiveAddition(x - 1)
  }
}

above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

columnMean <- function(x, removeNA = TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for (i in 1:nc) {
    means[i] <- mean(x[,i], na.rm = removeNA)
  }
  means
}

# help paste <- this is a good example of a function that takes ... as its first argument. All later
# functions need names clearly

make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)

y <- 10

f <- function(x) {
  y <- 2
  print(y)
  y^2 + g(x)
}

g <- function(x) {
  print(y)
  x * y
}

make.NegLogLik <- function(data, fixed=c(FALSE,FALSE)) {
  params <- fixed
  function (p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5 * length(data) * log(2 * pi * sigma^2)
    b <- -0.5 * sum((data-mu) ^2) / (sigma^2)
    -(a+b)
  }
}

# you can find optimal values with optimize
set.seed(1);
normals <- rnorm(100, 1, 2)

nLL <- make.NegLogLik(normals, c(FALSE,2))

optim(c(mu = 0, sigma = 1), nLL)$par

# Coding Standard as defined by the course
# Nothing to see here...

# Data

x <- Sys.time()

p <- as.POSIXlt(x)

# This has sec, min, hour, etc.

# x is already in POSIXct (represented as an integer relative to 1970-01-01)

# strptime() takes a character vector and a format string
