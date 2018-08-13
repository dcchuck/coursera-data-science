# directory - char vector length 1 indiicating csv file location

# pollutant - char vector length 1 indicating the pollutant
# in typescript land - "sulfate" | "nitrate"

# id - L vector, ID numbers to be used

completeCasesCountVector <- function(x) sum(complete.cases(x))

readInFiles <- function(directory, id = 1:332) {
  availableFileList <- list.files(pattern = ".csv", path = directory)
  filesToOpen <- paste(directory, "/", availableFileList[id], sep="")
  data.list <- lapply(filesToOpen, read.csv)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  data.list <- readInFiles(directory, id)
  data.workingSet <- do.call(rbind, data.list)
  valuesToAverage <- data.workingSet[pollutant]
  mean(valuesToAverage[,1], na.rm = TRUE)
}

print(pollutantmean("specdata", "sulfate", 1:10))
## [1] 4.064128

print(pollutantmean("specdata", "nitrate", 70:72))
## [1] 1.706047

print(pollutantmean("specdata", "nitrate", 23))
## [1] 1.280833

complete <- function(directory, id = 1:332) {
  data.list <- readInFiles(directory, id)
  f <- function(x) x$ID[1]
  a <- lapply(data.list, f)
  b <- lapply(data.list, completeCasesCountVector)
  data.frame(id = Reduce(c,a), nobs = Reduce(c,b))
}

print(complete("specdata", 1))
##   id nobs
## 1  1  117

print(complete("specdata", c(2, 4, 8, 10, 12)))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

print(complete("specdata", 30:25))
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

print(complete("specdata", 3))
##   id nobs
## 1  3  243

corr <- function(directory, threshold = 0) {
  data.list <- readInFiles(directory)
  b <- lapply(data.list, completeCasesCountVector)
  data.listToReport <- data.list[b > threshold]
  corFun <- function(x) cor(x$sulfate, x$nitrate, use = "complete.obs")
  ansList <- lapply(data.listToReport, corFun)
  unlist(ansList)
}

cr <- corr("specdata", 150)
print(head(cr))
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

print(summary(cr))
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

cr <- corr("specdata", 400)
print(head(cr))
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

print(summary(cr))
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

cr <- corr("specdata", 5000)
print(summary(cr))
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
print(length(cr))
## [1] 0


###

# Quiz Questions

###

print(pollutantmean("specdata", "sulfate", 1:10))
print(pollutantmean("specdata", "nitrate", 70:72))
print(pollutantmean("specdata", "sulfate", 34))
print(pollutantmean("specdata", "nitrate"))
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)
cc <- complete("specdata", 54)
print(cc$nobs)
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)
cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)
cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))

