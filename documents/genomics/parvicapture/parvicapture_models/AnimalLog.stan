data {
  int<lower=0>  N ; // # of libraries
  int<lower=0>  P ; // # of populations
  real y[N] ; // phenotype
  matrix[N, P] Q ; // population matrix
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A = cholesky_decompose(K) ; // cholesky-decomposed kinship
  real Vy = variance(log(y)) ;
}
parameters {
  vector<lower=0>[P] mu ; // intercept
  vector[N] epsilon ; // genotypic noise
  vector<lower=0, upper=sqrt(Vy)>[2] sigma ; // genetic variance
}
transformed parameters {

  vector[N] alog = sigma[1]*A*epsilon ;
}
model {
  y ~ lognormal(log(Q*mu) + alog, sigma[2]) ;
  epsilon ~ std_normal() ;
  mu ~ lognormal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vp = variance(log(Q*mu)) ; // population variance
  real Vg = square(sigma[1]) ; // genotypic variance
  real Vr = square(sigma[2]) ; // residual variance
}