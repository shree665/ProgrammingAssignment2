complete <- function(directory, id){
     
     for(i in id){
          csvfile <- sprintf("%03d.csv", i)
          filepath <- file.path(directory, csvfile)
          masterFrame <- read.csv(filepath, header=TRUE, sep=",")
          goodFrame <- complete.cases(masterFrame)
          masterGoodFrame <- masterFrame[goodFrame, ]
          rows <- nrow(masterGoodFrame)
          
          if(!exists("completeDataSetTable")){
               completeDataSetTable <- cbind("id"=i, "nobs"=rows)
          } else {
               tempTable <- cbind("id" = i, "nobs"=rows)
               completeDataSetTable <- rbind(completeDataSetTable, tempTable)
          }

      }
     completeDataSetTable
}