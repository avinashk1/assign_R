corr <- function(directory, threshold = 150) {
  dir<-getwd()
  if(dir != "D:/Data-Sc-Spec/rprog-data-specdata/specdata"){
    setwd(directory)
  }
  corr_up <- NULL
  id_arr<-NULL
  final<-complete(directory, id=1:332)
  r<-nrow(final)
  for (i in 1:r) {
    if (final[i,2] > threshold){
      id_arr<-c(id_arr,final[i,1])
    }
  }
  #print(id_arr)
  for (i in id_arr) {
    if (i >= 1 & i <= 9){
      f<-paste("0","0",i, ".csv",sep="")
    }else if(i>=10 & i <= 99){
      f<-paste("0",i, ".csv",sep="")
    } else {
      f<-paste(i, ".csv",sep="")
    }
    
    x<-read.csv(f, header=TRUE)
    y<-na.omit(x)
    colnames(y)<- NULL
    
    corr_up<-c(corr_up,cor(y[,2],y[,3]))
    
    
  }
    
  return(corr_up)

}