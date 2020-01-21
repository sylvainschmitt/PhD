data {
  int<lower=0>  N ; // # of individuals
  int<lower=0>  P ; // # of populations
  real Y[N] ; // phenotype
  int<lower=1, upper=P> population[N] ; // populations
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  real mu ; // intercept
  vector[P] muP ; // intercept
  vector[N]  a ; // breeding values
  real<lower=0> sigmaP ; // genetic variance
  real<lower=0> sigmaG ; // genetic variance
  real<lower=0> sigmaR ; // residual variance
}
model {
  Y ~ normal(muP[population] + A*a, sqrt(sigmaR)) ;
  a ~ normal(0, sqrt(sigmaG)) ;
  muP ~ normal(mu, sqrt(sigmaP)) ;
  mu ~ normal(0, 1) ;
  sigmaP ~ student_t(4, 0, 1) ;
  sigmaG ~ lognormal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
}
generated quantities{
  real<lower=0> h2 ; // strict heritabilities
  real<lower=0> h2p ; // broad heritabilities
  real<lower=0> Qst ; // quantitative genetic differentiations
  h2 = sigmaG ./ (sigmaP + sigmaG + sigmaR) ;
  h2p = (sigmaG + sigmaP) ./ (sigmaP + sigmaG + sigmaR) ;
  Qst = sigmaP ./ (sigmaP + 2*sigmaG) ;
}
