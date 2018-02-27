data {
  int<lower=0> I ; // Nb of observations
  vector<lower=0>[I] AGR ; // growth vector
  vector<lower=0>[I] dbh ; // dbh vector
  int<lower=0> ind[I] ; // individuals vector
}
parameters {
  real AGRmax ; // potential growth
  vector[I] AGRmax_ind ; // individual potential growth deviation
  real<lower=0,upper=200> Dopt ; // optimal diameter
  real Ks ; // kurtosis
  real<lower=0,upper=10> sigma ;
  real<lower=0,upper=10> sigma_ind ; // individual growth variation
}
model {
  AGRmax_ind ~ normal(AGRmax, sigma_ind) ;
  for(i in 1:I)
    log(AGR[i]+1) ~ normal(AGRmax_ind[ind[i]]*exp(-0.5*pow(log(dbh[i]/Dopt)/Ks,2)), sigma) ;
}
