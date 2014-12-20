complete <- function(directory, id = 1:332) {
  dir<-getwd()
  if(dir != "D:/Data-Sc-Spec/rprog-data-specdata/specdata"){
    setwd(directory)
  }
  i_app <- NULL
  c_app <- NULL
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
    y_l <- nrow(y)
    i_app<-c(i_app,i)
    c_app<-c(c_app,y_l)
  }
    
    final <- data.frame(i_app,c_app)
    colnames(final)<-c("id","nobs")
    #print(final)
  return(final)
}