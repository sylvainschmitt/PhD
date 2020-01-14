data {
  int<lower=0>  N ; // # of individuals
  real Y[N] ; // phenotype
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A ; // cholesky-decomposed kinship
  real<lower=0> sigmaY ; //  phenotypic variances
  A = cholesky_decompose(K) ;
  sigmaY = sd(Y)*sd(Y) ;
}
parameters {
  real mu ; // intercept
  vector[N]  a ; // breeding values
  real<lower=0> sigmaG ; // genetic variance
  real<lower=0> sigmaR ; // residual variance
}
model {
  mu ~ normal(0, 1) ;
  sigmaG ~ lognormal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
  
  a ~ normal(0, sqrt(sigmaG)) ;
  Y ~ normal(mu + A*a, sqrt(sigmaR));
}
generated quantities{
  real h2 ; // heritability
  h2 = sigmaG / sigmaY ;
}
