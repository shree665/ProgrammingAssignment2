
# function to calculate mean of csv files 
pollutantmean <- function(directory, pollutant,id){
     
     # looping using the id that is provided by the user
     for(i in id){
          csvfile <- sprintf("%03d.csv", i)
          
          filepath <- file.path(directory, csvfile)
          if(!exists("masterfoo")){
               masterfoo <- read.csv(filepath, header=TRUE, sep=",") 
          } else {
               # reading file using read.csv
               foo <- read.csv(filepath, header=TRUE, sep=",")
               masterfoo <- rbind(masterfoo,foo)
               
               # removing foo after binding to the master foo
               rm(foo)
          }
     }
     
     ## holding only a column that is provided as a parameter
     pollutantfoo <- masterfoo[,pollutant]
     
     ## removing all NA values from the column
     cleanedpollutantfoo <- pollutantfoo[!(is.na(pollutantfoo))]
     
     # calculating mean using mean function
     meanvalue <- round(mean(cleanedpollutantfoo), digits=3)
     
     # returning mean
     meanvalue 
     
}
