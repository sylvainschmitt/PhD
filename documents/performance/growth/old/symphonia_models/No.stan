data {
  int<lower=0> I ; // Nb of observations
  vector<lower=0>[I] AGR ; // growth vector
  vector<lower=0>[I] dbh ; // dbh vector
}
parameters {
  real AGRmax ; // potential growth
  real<lower=0,upper=200> Dopt ; // optimal diameter
  real<lower=0.1,upper=10> Ks ; // kurtosis
  real<lower=0,upper=100> sigma ;
}
model {
  for(i in 1:I)
    log(AGR[i]+1) ~ normal(AGRmax*exp(-0.5*pow(log(dbh[i]/Dopt)/Ks,2)), sigma) ;
}
generated quantities {
  vector[I] AGRpred ; // growth prediction vector
  for(i in 1:I)
    AGRpred[i] = exp(AGRmax*exp(-0.5*pow(log(dbh[i]/Dopt)/Ks,2)))-1 ;
}
