data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ;
  vector[I] DBH0 ;
  vector[I] Y0 ;
  vector[I] DBHtoday ;
  int<lower=1, upper=Y> pop[I] ; // gene pools
}
parameters {
  matrix<lower=0, upper=3>[P,3] theta ;
  matrix[I, 3] thetai ;
  vector<lower=0>[3] sigmaR ;
  real<lower=0> sigma ;
}
transformed parameters {
  vector<lower=0>[3] sigmaP = [variance(theta[,1]), 
                               variance(theta[,2]), 
                               variance(theta[,3])]';
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += exp(log(theta[pop,1]) + sigmaR[1]*thetai[,1]) .*
      exp(-0.5* square(log(DBH ./ (100*exp(log(theta[pop,2]) + sigmaR[2]*thetai[,2])))
      ./ exp(log(theta[pop,3]) + sigmaR[3]*thetai[,3]))) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma) ;
  for(p in 1:3){
    thetai[,p] ~ std_normal() ;
    theta[,p] ~ lognormal(0, 1) ;
  }
  sigmaR ~ normal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
