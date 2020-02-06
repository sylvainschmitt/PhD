data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  int<lower=1> G ; // # of gene pools
  vector[N] AGR ; // annual growth rate
  vector[N] DBH ; // diameter at breast height
  vector[N] TWI ; // topographic wetness index
  vector[N] AREW ; // area under the curve or relative water extractable
  vector[N] NCI ; // neighbor crowding index
  int<lower=1, upper=I> ind[N] ; // individual
  int<lower=1, upper=G> gp[N] ; // gene pools
  int<lower=1, upper=G> indingp[I] ; // individuals in gene pools
  vector[3] L;  // lower bounds
  vector[3] U;  // upper bounds
}
parameters {
  vector<lower=0, upper=1>[G] theta_raw[3] ;
  vector<lower=0, upper=1>[I] thetai_raw[3] ;
  vector<lower=0>[3] sigmaR ; // parameters residual variances
  real<lower=0,upper=2> sigma ; // variances
}
transformed parameters {
  vector[G] theta[3] ;
  vector[I] thetai[3] ;
  vector<lower=0>[3] sigmaP ; // population variances
  for(p in 1:3) {
    theta[p] = L[p] + (U[p] - L[p]) * theta_raw[p] ;
    thetai[p] = L[p] + (U[p] - L[p]) * thetai_raw[p] ;
    sigmaP[p] = variance(theta[p][indingp]) ;
  }
}
model {
  log(AGR+1) ~ normal(thetai[1][ind] .* exp(-0.5*(log(DBH ./ thetai[2][ind]) ./ thetai[3][ind]).*(log(DBH ./ thetai[2][ind]) ./ thetai[3][ind])), sigma) ; // likelihood
  for(p in 1:3)
    thetai[p]  ~ normal(theta[p][indingp], sqrt(sigmaR[p])) ;
  
  sigma ~ student_t(4, 0, 1) ;
}
generated quantities {
  vector[3] R2 ;
  R2 = sigmaP ./ (sigmaP + sigmaR) ;
}
