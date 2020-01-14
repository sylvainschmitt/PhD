data {
  int<lower=1>  N ; // # of individuals
  int<lower=1>  P ; // # of populations
  real Y[N] ; // phenotype
  vector<lower=0>[3] sigmaY ; // population phenotypic variances
  cov_matrix[N] K[P] ; // populations kinship covariance matrices
  int<lower=1, upper=P> pop[N] ; // populations
}
transformed data{
  matrix[N, N] A[P] ; // cholesky-decomposed kinship
  for(p in 1:P)
    A[p] = cholesky_decompose(K[p]) ;
}
parameters {
  vector[P]  mu ; // intercept
  vector[N]  a[P] ;  // populations breeeding values
  vector<lower=0>[3] sigmaG ; // population genetic variances
  real<lower=0> sigmaR ; // residual variance
}
model {
  vector[N] G ; // genetic additive effects
  
  mu ~ normal(0,1) ;  
  sigmaG ~ lognormal(0, 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
  
  G = rep_vector(0, N) ;
  for(p in 1:P) {
    G += A[p]*a[p] ;
    a[p] ~ normal(0, sqrt(sigmaG[p])) ;
  }
  Y ~ normal(mu[pop] + G, sqrt(sigmaR)) ;
}
generated quantities{
  real sigmaP ; // populations variation  
  vector[3] h2 ; // population heritabilities
  sigmaP = sd(mu) * sd(mu) ;
  h2 = sigmaG ./ sigmaY ;
}
