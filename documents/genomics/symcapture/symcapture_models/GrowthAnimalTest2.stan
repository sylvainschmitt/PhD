data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  vector[N] y ; // annual growth rate
  vector[N] x ; // diameter at breast height
  int<lower=1, upper=I> ind[N] ; // individual
  cov_matrix[I] K ; // kinship covariance matrix
  vector[3] L ;  // lower bounds
  vector[3] U ;  // upper bounds
}
transformed data{
  matrix[I, I] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0, upper=1>[3] theta_raw ;
  vector<lower=0, upper=1>[I] thetai_raw[3] ;
  vector[I]  a ; // breeding values
  real<lower=0> sigmaG ; // genetic variances
  vector<lower=0, upper=1>[3] sigmaR_raw ; // residual variances
  real<lower=0,upper=2> sigma ; // final residual variance
}
transformed parameters {
  vector[3] theta ;
  vector[I] thetai[3] ;
  vector<lower=0>[3] sigmaR ; // genetic variances
  for(p in 1:3) {
    theta[p] = L[p] + (U[p] - L[p]) * theta_raw[p] ;
    thetai[p] = L[p] + (U[p] - L[p]) * thetai_raw[p] ;
    sigmaR[p] = U[p]*sigmaR_raw[p] ;
  }
}
model {
  y ~ normal(thetai[1][ind] .* exp(-0.5*(log(x ./ thetai[2][ind]) ./ thetai[3][ind]).*(log(x ./ thetai[2][ind]) ./ thetai[3][ind])), sigma) ; // likelihood
  thetai[1]  ~ normal(theta[1] + A*a, sqrt(sigmaR[1])) ;
  a ~ normal(0, sqrt(sigmaG)) ;
  for(p in 2:3)
    thetai[p]  ~ normal(theta[p], sqrt(sigmaR[p])) ;
  sigmaG ~ normal(0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
