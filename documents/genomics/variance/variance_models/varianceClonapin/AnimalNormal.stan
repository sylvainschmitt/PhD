data {
  int<lower=1>  C ; // # of clones
  int<lower=1>  N ; // # of observation
  vector[N] height ; // height
  vector[N] yp ; // predicted log height
  int<lower=1, upper=C> clone[N] ; // clones
  cov_matrix[C] K ; // genepool matrix
}
transformed data{
  matrix[C, C] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector[C]  a ; // genotype additive values
  vector<lower=0>[2] sigma ; // variances
}
model {
  log(height) - yp ~ normal(sigma[2]*(A*a)[clone], sigma[1]) ;
  a ~ normal(0,1) ;
  sigma ~ cauchy(0,1) ;
}
generated quantities {
  real Vg = square(sigma[2]) ;
  real Vr = square(sigma[1]) ;
}
