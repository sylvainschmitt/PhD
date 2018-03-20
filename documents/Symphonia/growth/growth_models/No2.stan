data {
  int<lower=0> N ; // Nb of observations
  vector<lower=0>[N] AGR ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
}
parameters {
  real AGRmaxP ; // potential growth
  real<lower=0,upper=200> Dopt ; // optimal diameter
  real<lower=0.1,upper=10> Ks ; // kurtosis
  real<lower=0,upper=100> sigma ;
}
transformed parameters {
  real AGRmax ;
  AGRmax = AGRmaxP*Ks*Ks*Ks ;
}
model {
  for(n in 1:N)
    log(AGR[n]+1) ~ normal(AGRmax*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)), sigma) ;
}
generated quantities {
  vector[N] AGRpred ; // growth prediction vector
  for(n in 1:N)
    AGRpred[n] = exp(AGRmax*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)))-1 ;
}
