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
  real mu ; // intercept
  vector[P] muP ; // intercept
  vector[N]  a[P] ; // breeding values
  real<lower=0> sigmaP ; // genetic variance
  vector<lower=0>[P] sigmaG ; // genetic variance
  real<lower=0> sigmaR ; // residual variance
}
model {
  vector[N] aAsum ; // genetic additive effects
  aAsum = rep_vector(0, N) ; 
  for(p in 1:P) {
    aAsum += A[p]*a[p] ;
    a[p] ~ normal(0, sqrt(sigmaG[p])) ;  // individual random effects
  }
  Y ~ normal(muP[population] + aAsum, sqrt(sigmaR)) ;
  muP ~ normal(mu, sqrt(sigmaP)) ;
  mu ~ normal(0, 1) ;
  sigmaP ~ student_t(4, 0, 1) ;
  sigmaG ~ lognormal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
}
generated quantities{
  vector<lower=0>[P] h2 ; // strict heritabilities
  vector<lower=0>[P] h2p ; // broad heritabilities
  vector<lower=0>[P] Qst ; // quantitative genetic differentiations
  h2 = sigmaG ./ (sigmaP + sigmaG + sigmaR) ;
  h2p = (sigmaG + sigmaP) ./ (sigmaP + sigmaG + sigmaR) ;
  Qst = sigmaP ./ (sigmaP + 2*sigmaG) ;
}
