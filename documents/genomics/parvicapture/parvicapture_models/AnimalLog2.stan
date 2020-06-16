data {
  int<lower=0>  N ; // # of individuals
  int<lower=0>  P ; // # of populations
  real y[N] ; // phenotype
  int<lower=1, upper=P> population[N] ; // populations
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A = cholesky_decompose(K) ; // cholesky-decomposed kinship
}
parameters {
  vector<lower=0>[P] mu ; // intercept
  vector[N] epsilon ; // genotypic noise
  real<lower=0> sigma[2] ; // genetic variance
}
transformed parameters {
  vector[N] alog = sigma[2]*A*epsilon ;
}
model {
  y ~ lognormal(log(mu[population]) + alog, sigma[1]) ;
  epsilon ~ std_normal() ;
  mu ~ lognormal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vp = variance(log(mu[population])) ;
  real Vg = square(sigma[2]) ;
  real Vr = square(sigma[1]) ;
}
