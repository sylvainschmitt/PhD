data {
  int<lower=0> I ; // Nb of measurements
  vector<lower=0>[I] AGR ; // growth vector
  int<lower=0> J ; // Nb of gaps
  vector<lower=0>[J] S ; // gaps surface vector
  int<lower=0> K ; // Nb of individuals
  matrix<lower=0>[K,J] D ; // tree-gaps distance matrix
  int<lower=0> ind[I] ; // Individual number in matrix D
}
parameters {
  real AGRmax ; // potential, maximum growth parameter
  real alpha ; // disturbance reductor, distance parameter
  real<lower=0,upper=3> beta ; // disturbance reductor, surface parameter (power)
  real<lower=0,upper=10> sigma ; // variance
}
model {
  for(i in 1:I)
    log(AGR[i]+1) ~ normal(AGRmax*exp(-alpha*D[ind[i],] + beta*log(sum(S))), sigma) ;
}
