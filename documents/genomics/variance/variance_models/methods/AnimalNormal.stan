data {
  int<lower=1>  N ; // # of individuals
  int<lower=1>  P ; // # of populations
  vector[N] y ; // response
  cov_matrix[N] K ; // Kinship
  int<lower=1, upper=P>  population[N] ; // populations
}
transformed data{
  matrix[N, N] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector[P] mu ; // intercept
  vector[N] epsilon ; // genotype additive values
  vector<lower=0>[2] sigma ; // variances
}
transformed parameters {
  real Vp = variance(mu) ;
  vector[N] a = mu[population] + sigma[2]*A*epsilon ;
}
model {
  y ~ normal(mu[population] + a, sigma[1]) ;
  epsilon ~ std_normal() ;
  mu ~ normal(0,1) ;
  sigma ~ cauchy(0,1) ;
}
generated quantities {
  real Vg = square(sigma[2]) ;
  real Vr = square(sigma[1]) ;
}
