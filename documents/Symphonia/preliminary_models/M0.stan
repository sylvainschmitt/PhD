data {
  int<lower=0> N ; // # obs
  vector<lower=0>[N] dbh ; // obs
  vector<lower=0>[N] agr ; // pred
}
parameters {
  real<lower=0> m ;
  real<lower=0> dopt ;
  real<lower=0> ks ;
  real<lower=0,upper=10> sigma ;
}
model {
  m ~ normal(1, 10^4) ;
  dopt ~ normal(1, 10^4) ;
  ks ~ normal(1, 10^4) ;
  sigma ~ gamma(10^-2, 10^-2) ;
  for(n in 1:N)
    agr[n] ~ lognormal(m*exp(-0.5*log(dbh[n]/(dopt/ks))*log(dbh[n]/(dopt/ks))), sigma) ;
}
