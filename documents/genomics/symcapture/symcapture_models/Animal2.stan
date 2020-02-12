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
  vector[P] mu ; // intercept
  vector[N]  a ; // breeding values
  real<lower=0> sigmaG ; // genetic variance
  real<lower=0> sigmaR ; // residual variance
}
model {
  Y ~ normal(mu[population] + A*a, sqrt(sigmaR)) ;
  a ~ normal(0, sqrt(sigmaG)) ;
  sigmaG ~ normal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
}
