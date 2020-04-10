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
  vector<lower=0>[P] mu ; // intercept
  vector[N] epsilon ; // genotype additive values
  vector<lower=0>[2] sigma ; // variances
}
transformed parameters {
  real Vp = variance(mu) ;
  vector<lower=0>[N] a = exp(log(mu[population]) + sigma[2]*epsilon) ;
}
model {
  y ~ lognormal(log(A*a), sigma[1]) ;
  epsilon ~ std_normal() ;
  mu ~ lognormal(0,1) ;
  sigma ~ cauchy(0,1) ;
}
generated quantities{
  real Vg = variance(log(a) - log(mu[population])) ;
  real Vr = variance(to_vector(log(y)) - log(A*a)) ;
}
