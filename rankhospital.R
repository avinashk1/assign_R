rankhospital <- function(state, outcome, num = "best") {
  x<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  outcome_vec<-c("heart attack","heart failure","pneumonia")
  state_vec<-x[,7]
  state_vec<-unique(state_vec)
  if (!is.element(state,state_vec)){
    stop("Error:invalid state")
  }
  if (!is.element(outcome,outcome_vec)){
    stop("Error:invalid outcome")
  }
  x_sp<-x[x[,"State"] == state,]
  x_h<-x_sp[,2]
  if(outcome == outcome_vec[1]){
    x_out<-as.numeric(x_sp[,11])
    
    x_rank<-x_sp[(order(x_out,x_h,na.last=NA)),]
    
  } else if(outcome == outcome_vec[2]){
    x_out<-as.numeric(x_sp[,17])
    x_rank<-x_sp[(order(x_out,x_h,na.last=NA)),]
  }else if(outcome == outcome_vec[3]){
    x_out<-as.numeric(x_sp[,23])
    x_rank<-x_sp[(order(x_out,x_h,na.last=NA)),]
  }
  x_hosp<-x_rank[,2]
  if (num=="best"){
    num<-1
  }else if (num == "worst"){
    num<-length(x_hosp)
  }
  print(x_hosp[num])
}