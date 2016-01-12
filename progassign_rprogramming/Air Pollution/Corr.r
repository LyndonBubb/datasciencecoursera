##corr function
corr <- function(directory, threshold = 0) {
## Sourcing the Data from the Complete Function
  source("complete.R") 
  completeCases <- complete(directory)
## Subset where Complete Cases greater than a threshold
  casesAboveThreshold <- completeCases[completeCases$nobs > threshold,1]
##Creates a list of files
  files_list <- list.files(directory, full.names = TRUE); 
## Creating a correlations Value and setting to NA
##  correlations <- rep(NA,length(casesAboveThreshold))
##Create an empty vector
  correlations <- c();
## Populating data for the Cor Calculation from files_list based upon cases Above Threshold
  for (index in casesAboveThreshold) {
    fileData <- (read.csv(files_list[index]))
    completeCases <- complete.cases(fileData)
    SulfateData <- fileData[completeCases, 2]
    NitrateData <- fileData[completeCases, 3]
## Cor Function as specified by the guidnace notes    
    correlations[index] <- cor(x = SulfateData, y = NitrateData)
  }
## Sets Corr data
  correlations <- correlations[complete.cases(correlations)];
## Return Corr Data
  correlations;
}
