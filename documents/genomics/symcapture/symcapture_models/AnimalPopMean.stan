data {
  int<lower=1>  N ; // # of individuals
  real Y[N] ; // phenotype
  cov_matrix[N] K ; // kinship covariance matrix
  int<lower=1>  P ; // # of populations
  int<lower=1, upper=P> pop[N] ; // populations
}
transformed data{
  matrix[N, N] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector[P]  mu ;
  vector[N]  a ;
  real<lower=0> sigmaG ; // population variation
  real<lower=0> sigmaR ; // residual variation
}
model {
  mu ~ normal(0,1) ;  
  sigmaG ~ lognormal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;

  Y ~ normal(mu[pop] + A*a, sqrt(sigmaR));
  a ~ normal(0, sqrt(sigmaG)) ;
}
generated quantities{
  real sigmaP ; // populations variation  
  real h2 ; // heritability
  sigmaP = sd(mu) * sd(mu) ;
  h2 = sigmaG / (sigmaG + sigmaR) ;
}
