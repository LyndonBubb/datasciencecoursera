##complete Function
complete <- function(directory, id = 1:332) {
##Creates a list of files
  files_list <- list.files(directory, full.names = TRUE);  
##Create empty data.frames
  data <- data.frame();
  nobs <- data.frame ();
  completeCases <- data.frame();
##Read (Loop) in all the files
  for (index in id) {
    data <- read.csv(files_list[index]);
##Checking for Completed.Cases    
    nobs <- sum(complete.cases(data));
    completeCases <- rbind(completeCases, data.frame(index,nobs));
  }
##Returns completeCases;
  completeCases;
}
