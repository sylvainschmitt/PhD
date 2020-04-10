data {
  int<lower=0>  N ; // # of individuals
  int<lower=0>  P ; // # of populations
  real Y[N] ; // phenotype
  int<lower=1, upper=P> population[N] ; // populations
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A = cholesky_decompose(K) ; // cholesky-decomposed kinship
}
parameters {
  vector<lower=0>[P] mu ; // intercept
  vector[N] epsilon ; // breeding values
  real<lower=0> sigmaG ; // genetic variance
  real<lower=0> sigmaR ; // residual variance
}
transformed parameters {
  real<lower=0> Vp = variance(mu) ; // population variance
  vector<lower=0>[N] a = exp(log(mu[population]) + sigmaG*epsilon) ;
}
model {
  mu ~ lognormal(0, 1) ;
  sigmaG ~ normal(0, 1) ;
  sigmaR ~ normal(0, 1) ;
  epsilon ~ normal(0, 1) ;
  Y ~ lognormal(log(A*a), sigmaR) ;
}
generated quantities{
  real Vg = variance(log(a) - log(mu[population])) ;
  real Vr = variance(to_vector(log(Y)) - log(A*a)) ;
  real R2m  = Vp / (Vp + Vg + Vr) ;
  real R2c = (Vp + Vg) / (Vp + Vg + Vr) ;
}
