data {
  int<lower=0> I ; // Nb of measurements
  vector<lower=0>[I] AGR ; // growth vector
  vector<lower=0>[I] dbh ; // dbh vector
  int<lower=0> J ; // Nb of gaps
  vector<lower=0>[J] S ; // gaps surface vector
  int<lower=0> K ; // Nb of individuals
  matrix<lower=0>[K,J] D ; // tree-gaps distance matrix
  int<lower=0> ind[I] ; // Individual number in matrix D
}
parameters {
  real AGRmax ; // potential, maximum growth parameter
  real dopt ; // ontogenic reductor, optimal diameter parameter
  real ks ; // ontogenic reductor, kurtosis parameter
  real alpha ; // disturbance reductor, distance parameter
  real<lower=0,upper=3> beta ; // disturbance reductor, surface parameter (power)
  real<lower=0,upper=10> sigma ; // variance
}
transformed parameters {
  vector[J] Sbeta ; // Sbeta is S^beta because pow(vector,real) is impossible in stan
  vector[K] Idisturb ; // disturbance index
  for(j in 1:J)
    Sbeta[j] = pow(S[j], beta) ;
  for(k in 1:K)
    Idisturb[k] = exp(-alpha*D[k,])*Sbeta ;
}
model {
  for(i in 1:I)
    log(AGR[i]+1) ~ normal(AGRmax*exp(-0.5*(log(dbh[i]/dopt)/ks)*(log(dbh[i]/dopt)/ks))*exp(-Idisturb[ind[i]]), sigma) ;
}
