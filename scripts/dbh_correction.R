correction <- function(X, tm, status, code=NULL) {
  # X: dbh vector/ tm: census year/ status: status of tree
  
  # order X, status and tm by census year (tm)
  X <- X[order(tm)]
  status <- status[order(tm)]
  tm <- sort(tm)
  
  # cresc : annual diameter increment
  cresc <- diff(X)/diff(tm)
  cresc[is.na(cresc)] <- 0
  
  if (length(cresc)>0 ){           # if we have at least 2 censuses
    
    if (max((cresc))>5) {    # excessive dbh increase:  > 5 cm/year
      
      if (abs(sum(range(cresc*diff(tm)))) < 3) {
        # 1st case: excessive increase is offset by a similar decrease in dbh
        # correction: "abnormal" values are deleted and will be replaced later, with other missing values
        first <- min(which.max(cresc), which.min(cresc))+1
        last <- max(which.max(cresc), which.min(cresc))
        X[first:last] <- NA
        
      } else {
        
        ab <- which.max(abs(cresc))
        existing <- c(ab-2,ab-1,ab+1,ab+2)
        existing <- existing[existing > 0]
        meancresc <- mean(cresc[existing])
      
        # 2nd case: increase of more than 5 cm/yr with no return to initial values
        # if we have Paracou's "code mesure", we trust the set of values with more code_mesure = 0
        # else, we trust the new measurements and change the 1st set of values
        if (length(code)>0 & sum((code==0)[1:ab]) > sum((code==0)[-(1:ab)]) ) {
          X[-(1:ab)] <- X[-(1:ab)] - max((cresc)*diff(tm)) + meancresc*diff(tm)[ab]
        } else {X[1:ab] <- X[1:ab] + max((cresc)*diff(tm)) - meancresc*diff(tm)[ab] }
      }
      
      # update cresc
      cresc <- diff(X)/diff(tm)
      cresc[is.na(cresc)] <- 0
    } 
    
    
    if (min(cresc*diff(tm))<(-2) ) {     # decrease > 2 cm between 2 censuses
      
      # census with excessive decrease in dbh
      ab <- which.min(cresc*diff(tm))
      existing <- c(ab-2,ab-1,ab+1,ab+2)
      existing <- existing[existing > 0]
      meancresc <- mean(cresc[existing])
      
      # 1st case: one low value and then return to a "normal" dbh
      if ( ab < length(cresc) & ( sum( (cresc*diff(tm))[ab], (cresc*diff(tm))[ab+1]) >= 0 ) ) {
        X[ab+1] <- NA  
        
        # 2nd case: one high value and then return to a "normal" dbh
      } else  {
        if ( ab > 1 & sum((cresc*diff(tm))[ab], (cresc*diff(tm))[ab-1]) >= 0 ){
          X[ab] <- NA  
          
          
        # 3rd case: no return to initial values: retrieve difference from 1st set of values (trust last measurements)
        }  else {          
          # if we have Paracou's "code mesure", we trust the set of values with more code_mesure = 0
          # else, we trust the old measurements and change the 2nd set of values
          if (length(code)> 0 & sum((code==0)[1:ab]) < sum((code==0)[-(1:ab)]) ) {
            X[1:ab] <- X[1:ab] + min((cresc)*diff(tm)) - meancresc*diff(tm)[ab]  
          } else {X[-(1:ab)] <- X[-(1:ab)] - min((cresc)*diff(tm)) + meancresc*diff(tm)[ab]}
          
        } 
      }
      # update cresc
      cresc <- diff(X)/diff(tm)
      cresc[is.na(cresc)] <- 0
    }
    
    
    # missing data : make a linear regression to complete data
    reg <- lm(X ~ tm)$coefficients
    X[which(status==1 & is.na(X))] <- reg[1]+reg[2]*tm[which(status==1 & is.na(X))]
    # update cresc
    cresc <- diff(X)/diff(tm)
    cresc[is.na(cresc)] <- 0
  }
  
  return(X)
  
}

detect <- function(X, tm) {
  C<-"no"
  if(length(X)>1){
    # cresc : annual diameter increment
    cresc <- diff(X)/diff(tm)
    cresc[is.na(cresc)] <- 0
    if(max(cresc, na.rm=T)>7.5) {
      C<-"excessive growth"
    } else if (min(cresc*diff(tm), na.rm=T)<(-2)) {
      C<-"excessive decrease"
    } }
  return(C)
}