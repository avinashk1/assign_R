best <- function(state, outcome) {
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
  #min(x_sp)
  if(outcome == outcome_vec[1]){
    #print(outcome)
    #print(as.numeric(x_sp[,11]))
    min<-min(as.numeric(x_sp[,11]),na.rm=TRUE)
    #print(x_sp)
    x_min<-x_sp[na.omit(x_sp[,11])==min,2]
    
  } else if(outcome == outcome_vec[2]){
    min<-min(as.numeric(x_sp[,17]),na.rm=TRUE)
    x_min<-x_sp[na.omit(x_sp[,17])==min,2]
  }else if(outcome == outcome_vec[3]){
    min<-min(as.numeric(x_sp[,23]),na.rm=TRUE)
    x_min<-x_sp[na.omit(x_sp[,23])==min,2]
  }
  
  print(min)
  print(x_min)
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}
