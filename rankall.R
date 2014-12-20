rankall <- function(outcome, num = "best") {
  x<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  outcome_vec<-c("heart attack","heart failure","pneumonia")
  state_vec<-x[,7]
  state_vec<-sort(unique(state_vec))
  #print(state_vec)
  #if (!is.element(state,state_vec)){
  #  stop("Error:invalid state")
  #}
  if (!is.element(outcome,outcome_vec)){
    stop("Error:invalid outcome")
  }
  
  x_list<-NULL
  for (s in state_vec) {
    x_sp<-x[x[,"State"] == s,]
    #print(s)
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
      num1<-1
    }else if (num == "worst"){
      num1<-length(x_hosp)
    }else {
      num1<-num
    }  
    x_list<-c(x_list,x_hosp[num1])
    
  }
  x_final<-data.frame(x_list,state_vec)
  colnames(x_final)<-c("hospital","state")
  print(x_final)

}