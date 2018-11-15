data {
  int<lower=1> N ; // Nb of observations
  vector<lower=0>[N] AGR ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
  int<lower=1> I ; // Nb of individuals
  int<lower=0> ind[N] ; // individuals vector
}
parameters {
  real AGRmaxP ; // potential growth
  vector[I] AGRmax_ind ; // individual potential growth deviation
  real<lower=0,upper=200> Dopt ; // optimal diameter
  real<lower=0.1,upper=10> Ks ; // kurtosis
  real<lower=0,upper=10> sigma_ind ; // individual growth variation
  real<lower=0,upper=100> sigma ;
}
transformed parameters {
  real AGRmax ;
  AGRmax = AGRmaxP*Ks^3 ;
}
model {
  AGRmax_ind ~ normal(AGRmax, sigma_ind) ;
  for(n in 1:N)
    log(AGR[n]+1) ~ normal(AGRmax_ind[ind[n]]*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)), sigma) ;
}
generated quantities {
  vector[N] AGRpred ; // growth prediction vector
  vector[N] AGRpred_ind ; // growth prediction vector
  for(n in 1:N)
    AGRpred[n] = exp(AGRmax*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)))-1 ;
  for(n in 1:N)
    AGRpred_ind[n] = exp(AGRmax_ind[ind[n]]*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)))-1 ;
}
