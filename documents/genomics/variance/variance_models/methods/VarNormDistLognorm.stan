data {
  int<lower=1>  N ; // # of individuals
  int<lower=1>  P ; // # of populations
  vector[N] ynorm ; // response
  cov_matrix[N] K ; // Kinship
  int<lower=1, upper=P>  population[N] ; // populations
}
transformed data{
  matrix[N, N] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector[P] mu ; // intercept
  vector[N] a ; // genotype additive values
  vector<lower=0>[2] sigma ; // variances
}
transformed parameters {
  vector[N] u = sigma[2]*A*a ;
}
model {
  exp(ynorm) ~ lognormal(mu[population] + u, sigma[1]) ;
  a ~ std_normal() ;
  mu ~ normal(0,1) ;
  sigma ~ cauchy(0,1) ;
}
