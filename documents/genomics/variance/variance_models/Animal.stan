data {
  int<lower=1>  N ; // # of individuals
  real Y[N] ; // phenotype
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector[N]  a ; // breeding values
  vector<lower=0>[2] sigma ; // genetic and residual variance
}
model {
  Y ~ normal(sigma[1]*A*a, sigma[2]) ;
  a ~ std_normal() ;
  sigma ~ normal(0, 1) ;
}