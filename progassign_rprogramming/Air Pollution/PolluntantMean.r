##PolluntantMean Function
pollutantmean <- function(directory, pollutant, id = 1:332) {
##Creates a list of files
  files_list <- list.files(directory, full.names = TRUE);
##Create an empty data.frame
  data <- data.frame();
##Bind (Loop) in all the files
  for (index in id) {
    data <- rbind(data, read.csv(files_list[index]))
  }
##Mean Calculation
  pollutantMean <- mean(data[[pollutant]], na.rm = TRUE);
##Returns pollutantMean;
  pollutantMean; 
 }
