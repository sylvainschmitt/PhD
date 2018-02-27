data {
  int<lower=0> N ; // Nb of trees
  vector<lower=0>[N] growth ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
}
parameters {
  real Gmax ; // potential growth
  real<lower=0,upper=200> Dopt ; // optimal diameter
  real Ks ; // kurtosis
  real<lower=0,upper=10> sigma ;
}
model {
  for(n in 1:N)
    log(growth[n]+1) ~ normal(Gmax*exp(-0.5*pow(log(dbh[n]/Dopt)/Ks,2)), sigma) ;
}
