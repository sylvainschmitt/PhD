data {
  int<lower=1> N ; // Nb of observations
  vector<lower=0>[N] AGR ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
  int<lower=1> S ; // Nb of species
  int<lower=0> sp[N] ; // species vector
}
parameters {
  real AGRmaxP ; // potential growth
  vector[S] AGRmax_sp ; // species potential growth deviation
  real<lower=0,upper=100> sigma_AGRmax ; // individual growth variation
  real<lower=0,upper=200> Dopt ; // optimal diameter
  vector<lower=0,upper=300>[S] Dopt_sp ; // species optimal diameter
  real<lower=0,upper=100> sigma_Dopt ; // individual opitmal diameter variation
  real<lower=0.1,upper=10> Ks ; // kurtosis
  vector<lower=0.1,upper=10>[S] Ks_sp ; // species kurtosis
  real<lower=0,upper=100> sigma_Ks ; // individual kurtosis variation
  real<lower=0,upper=100> sigma ;
}
transformed parameters {
  real AGRmax ;
  AGRmax = AGRmaxP*Ks^3 ;
}
model {
  AGRmax_sp ~ normal(AGRmax, sigma_AGRmax) ;
  Dopt_sp ~ normal(Dopt, sigma_Dopt) ;
  Ks_sp ~ normal(Ks, sigma_Ks) ;
  for(n in 1:N)
    log(AGR[n]+1) ~ normal(AGRmax_sp[sp[n]]*exp(-0.5*pow(log(dbh[n]/Dopt_sp[sp[n]])/Ks_sp[sp[n]],2)), sigma) ;
}
generated quantities {
  vector[N] AGRpred ; // growth prediction vector
  vector[N] AGRpred_sp ; // growth prediction vector
  for(n in 1:N)
    AGRpred[n] = exp(AGRmax*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)))-1 ;
  for(n in 1:N)
    AGRpred_sp[n] = exp(AGRmax_sp[sp[n]]*exp(-0.5*pow(log(dbh[n]/Dopt_sp[sp[n]])/Ks_sp[sp[n]],2)))-1 ;
}
