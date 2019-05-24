data {
  int<lower=1> N ; // Nb of observations
  vector<lower=0>[N] AGR ; // growth vector
  vector<lower=0>[N] dbh ; // dbh vector
  int<lower=1> S ; // Nb of species
  int<lower=0> sp[N] ; // species vector
  int<lower=1> I ; // Nb of individuals
  int<lower=0> ind[N] ; // individual vector
  int<lower=0> indsp[I] ; // individual in species vector
}
parameters {
  vector<lower=0.1,upper=10>[I] AGRmaxind ; // individual potential growth
  vector<lower=0.1,upper=10>[S] AGRmax ; // species potential growth
  vector<lower=0,upper=10>[S] sigmaInd ; // individual potential growth deviation
  vector<lower=0,upper=200>[S] Dopt ; // optimal diameter
  vector<lower=0.1,upper=10>[S] Ks ; // kurtosis
  real<lower=0,upper=10> sigma ;
}
model {
  AGRmaxind ~ normal(AGRmax[indsp], sigmaInd[indsp]) ;
  for(n in 1:N)
    log(AGR[n]+1) ~ normal(AGRmaxind[ind[n]]*exp(-0.5*pow(log(dbh[n]/Dopt[sp[n]])/Ks[sp[n]], 2)), sigma) ;
}
generated quantities {
  vector<lower=0>[N] AGRpred ;
  for(n in 1:N)
    AGRpred[n] = AGRmaxind[ind[n]]*exp(-0.5*pow(log(dbh[n]/Dopt[sp[n]])/Ks[sp[n]], 2)) ;
}
