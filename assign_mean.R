pollutantmean <- function(directory, pollutant, id = 1:332) {
  dir<-getwd()
  if(dir != "D:/Data-Sc-Spec/rprog-data-specdata/specdata"){
    setwd(directory)
  }
  y_app <- NULL
  for (i in id) {
    if (i >= 1 & i <= 9){
      f<-paste("0","0",i, ".csv",sep="")
    }else if(i>=10 & i <= 99){
      f<-paste("0",i, ".csv",sep="")
    } else {
      f<-paste(i, ".csv",sep="")
    }
    
    x<-read.csv(f, header=TRUE)
    
    y<-na.omit(x)
    #print(y)
    if (pollutant == "nitrate") {
      j <-3
    } else if (pollutant == "sulfate"){
      j <-2
    }
    y_app<- append(y_app,y[,j])
    
    # for sum
    #sum<-colSums(x[,-1], na.rm=TRUE)
    #sum_pollutant <- sum[j]
    #names(sum_pollutant)<- NULL
    #sum1 <- sum1 + sum_pollutant
    
  }
  len<-length(y_app)
  print(sum(y_app)/(len))
}
