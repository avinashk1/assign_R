pollutantmean <- function(directory, pollutant, id = 1:332) {
  dir<-getwd()
  if(dir != "D:/Data-Sc-Spec/rprog-data-specdata/specdata"){
    setwd(directory)
  }
  sum1 <- 0
  for (i in id) {
  if (i >= 1 & i <= 9){
    f<-paste("0","0",i, ".csv",sep="")
  }else if(i>=10 & i <= 99){
    f<-paste("0",i, ".csv",sep="")
  } else {
    f<-paste(i, ".csv",sep="")
  }
  
  x<-read.csv(f, header=TRUE)

  #y<-na.omit(x)
  #print(y)
  if (pollutant == "nitrate") {
    j <-2
  } else if (pollutant == "sulfate"){
    j <-1
  }
  
  # for sum
  #sum<-colSums(x[,-1], na.rm=TRUE)
  #sum_pollutant <- sum[j]
  #names(sum_pollutant)<- NULL
  #sum1 <- sum1 + sum_pollutant
  
  }
  #print(sum1)
}
  