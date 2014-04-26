corr <- function(directory, threshold=0){
     
     result <- numeric()
     
     allFiles <- list.files(path="/Users/shree665/desktop/coursera/specdata",pattern="*.csv", full.names=TRUE)
     
     for(i in 1:length(allFiles)){
          csvfile <- sprintf("%03d.csv", i)
          filepath <- file.path(directory, csvfile)
          masterFrame <- read.csv(filepath, header=TRUE, sep=",")
          goodFrame <- complete.cases(masterFrame)
          masterGoodFrame <- masterFrame[goodFrame, ]
          rows <- nrow(masterGoodFrame)
          if(rows > threshold){
               if(!exists("result")){
                    result <- cor(masterGoodFrame$sulfate, masterGoodFrame$nitrate)
               } else {
                    tempResult <- cor(masterGoodFrame$sulfate, masterGoodFrame$nitrate)
                    result <- rbind(result, tempResult)
                    rm(tempResult)
               }
               
          }
     }
     
     roundedResult <- round(result, digits=5)
     roundedResultVector <- as.vector(roundedResult)
     
     roundedResultVector
}