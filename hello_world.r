print("hello world! Console world that is.")

print("How is my lag?")

# Removing NA Values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

homeworkData <- read.csv("hw1_data.csv")
print(attributes(homeworkData))
print(colnames(homeworkData))

hasNans <- is.na(homeworkData)
cleanData <- homeworkData[!hasNans]

# Ozone > 31 & Temp > 90

q18 <- homeworkData[homeworkData$Ozone > 31 & homeworkData$Temp > 90,]
mean(q18)