data {
  int<lower=1> N ; // Nb of observations
  vector<lower=0>[N] AGR ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
  vector[N] suitability ; 
  int<lower=1> S ; // Nb of species
  int<lower=0> sp[N] ; // species vector
}
parameters {
  vector[S] g0 ; // species potential growth
  vector[S] gSuitability ; 
  vector<lower=0,upper=200>[S] d0 ; // optimal diameter
  vector<lower=0.1,upper=10>[S] k0 ; // kurtosis
  vector[S] dSuitability ;
  vector[S] kSuitability ;
  real<lower=0,upper=10> sigma ;
}
model {
  for(n in 1:N)
    log(AGR[n]+1) ~ normal((g0[sp[n]] + gSuitability[sp[n]]*suitability[n])*exp(-0.5*pow(log(dbh[n]/(d0[sp[n]] + dSuitability[sp[n]]*suitability[n]))/(k0[sp[n]] + kSuitability[sp[n]]*suitability[n]), 2)), sigma) ;
}
