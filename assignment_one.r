pollutantmean <- function(directory, pollutant, id = 1:332) {
  # directory - char vector length 1 indiicating csv file location
  
  # pollutant - char vector length 1 indicating the pollutant
  # in typescript land - "sulfate" | "nitrate"
  
  # id - L vector, ID numbers to be used
  
  fileList <- list.files(pattern = ".csv", path = directory)
  print(fileList)
  
  # return - the mean pollutant across all monitors
}

pollutantmean(directory = "specdata")