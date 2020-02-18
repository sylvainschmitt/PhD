data {
  int<lower=0>  N ; // # of individuals
  int<lower=0>  P ; // # of populations
  real Y[N] ; // phenotype
  int<lower=1, upper=P> population[N] ; // populations
  cov_matrix[N] K[P] ; // population kinship covariance matrices
}
transformed data{
  matrix[N, N] A[P] ; // cholesky-decomposed kinship
  for(p in 1:P)
    A[p] = cholesky_decompose(K[p]) ;
}
parameters {
  vector[P] mu ; // intercept
  vector[N]  a[P] ; // breeding values
  vector<lower=0>[P] sigmaG ; // genetic variance
  real<lower=0> sigmaR ; // residual variance
}
transformed parameters {
  real<lower=0> sigmaP ; // population variance
  sigmaP = variance(mu) ;
}
model {
  vector[N] aAsum ; // genetic additive effects
  aAsum = rep_vector(0, N) ; 
  for(p in 1:P) {
    aAsum += A[p]*a[p] ;
    a[p] ~ normal(0, sqrt(sigmaG[p])) ;  // individual random effects
  }
  Y ~ normal(mu[population] + aAsum, sqrt(sigmaR)) ;
  sigmaG ~ normal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
}
generated quantities{
  vector<lower=0>[P] R2m ;
  vector<lower=0>[P] R2c ;
  R2m = sigmaP ./ (sigmaP + sigmaG + sigmaR) ;
  R2c = (sigmaG + sigmaP) ./ (sigmaP + sigmaG + sigmaR) ;
}
