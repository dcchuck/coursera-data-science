print("hello world! Console world that is.")

print("How is my lag?")

# Removing NA Values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

homeworkData <- read.csv("hw1_data.csv")
print(attributes(homeworkData))
print(colnames(homeworkData))

cleanData <- homeworkData[complete.cases(homeworkData),]

# Ozone > 31 & Temp > 90

q18 <- cleanData[cleanData$Ozone > 31 & cleanData$Temp > 90,]
mean(q18$Solar.R)

q19 <- homeworkData[homeworkData$Month == 6 & !is.na(homeworkData$Month),]
mean(q19$Temp)

q20 <- homeworkData[homeworkData$Month == 5 & !is.na(homeworkData$Ozone),]