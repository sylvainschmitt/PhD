data {
  int<lower=1> N ; // Nb of observations
  vector<lower=0>[N] AGR ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
  int<lower=1> S ; // Nb of species
  int<lower=0> sp[N] ; // species vector
}
parameters {
  vector[S] AGRmaxP_sp ; // potential growth
  vector<lower=0,upper=300>[S] Dopt_sp ; // species optimal diameter
  vector<lower=0.1,upper=10>[S] Ks_sp ; // species kurtosis
  vector<lower=0,upper=100>[S] sigma_sp ; // species variance
}
transformed parameters {
  vector[S] AGRmax_sp ; // species potential growth
  for(s in 1:S)
    AGRmax_sp[s] = AGRmaxP_sp[s]*Ks_sp[s]*Ks_sp[s]*Ks_sp[s] ;
}
model {
  for(n in 1:N)
    log(AGR[n]+1) ~ normal(AGRmax_sp[sp[n]]*exp(-0.5*pow(log(dbh[n]/Dopt_sp[sp[n]])/Ks_sp[sp[n]],2)), sigma_sp[sp[n]]) ;
}
generated quantities {
  vector[N] AGRpred_sp ; // growth prediction vector
  for(n in 1:N)
    AGRpred_sp[n] = exp(AGRmax_sp[sp[n]]*exp(-0.5*pow(log(dbh[n]/Dopt_sp[sp[n]])/Ks_sp[sp[n]],2)))-1 ;
}
