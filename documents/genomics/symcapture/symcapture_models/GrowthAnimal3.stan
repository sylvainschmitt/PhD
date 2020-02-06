data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  int<lower=1> G ; // # of gene pools
  vector[N] AGR ; // annual growth rate
  vector[N] DBH ; // diameter at breast height
  int<lower=1, upper=I> ind[N] ; // individual
  int<lower=1, upper=G> gp[N] ; // gene pools
  int<lower=1, upper=G> indingp[I] ; // individuals in gene pools
  cov_matrix[I] K ; // kinship covariance matrix
  vector[3] L ;  // lower bounds
  vector[3] U ;  // upper bounds
}
transformed data{
  matrix[I, I] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0, upper=1>[G] theta_raw[3] ;
  vector<lower=0, upper=1>[I] thetai_raw[3] ;
  vector[I]  a[3] ; // breeding values
  vector<lower=0, upper=1>[3] sigmaG_raw ; // genetic variances
  vector<lower=0, upper=1>[3] sigmaR_raw ; // residual variances
  real<lower=0,upper=2> sigma ; // final residual variance
}
transformed parameters {
  vector[G] theta[3] ;
  vector[I] thetai[3] ;
  vector<lower=0>[3] sigmaG ; // genetic variances
  vector<lower=0>[3] sigmaR ; // genetic variances
  vector<lower=0>[3] sigmaP ; // population variances
  for(p in 1:3) {
    theta[p] = L[p] + (U[p] - L[p]) * theta_raw[p] ;
    thetai[p] = L[p] + (U[p] - L[p]) * thetai_raw[p] ;
    sigmaP[p] = variance(theta[p][indingp]) ;
    sigmaG[p] = U[p]*sigmaG_raw[p] ;
    sigmaR[p] = U[p]*sigmaR_raw[p] ;
  }
}
model {
  log(AGR+1) ~ normal(thetai[1][ind] .* exp(-0.5*(log(DBH ./ thetai[2][ind]) ./ thetai[3][ind]).*(log(DBH ./ thetai[2][ind]) ./ thetai[3][ind])), sigma) ; // likelihood
  for(p in 1:3) {
    thetai[p]  ~ normal(theta[p][indingp] + A*a[1], sqrt(sigmaR[p])) ;
    a[p] ~ normal(0, sqrt(sigmaG[p])) ;
  }
  sigmaR_raw ~ lognormal(0, 1) ;
  sigmaG_raw ~ lognormal(0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
generated quantities{
  vector[3] R2m ;
  vector[3] R2c ;
  R2m = sigmaP ./ (sigmaP + sigmaG + sigmaR) ;
  R2c = (sigmaP + sigmaG) ./ (sigmaP + sigmaG + sigmaR) ;
}
