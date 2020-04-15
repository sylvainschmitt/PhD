data {
  int<lower=0>  N ; // # of individuals
  int<lower=0>  P ; // # of populations
  real y[N] ; // phenotype
  int<lower=1, upper=P> population[N] ; // populations
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A = cholesky_decompose(K) ; // cholesky-decomposed kinship
}
parameters {
  vector<lower=0>[P] mu ; // intercept
  vector[N] epsilon ; // genotypic noise
  vector<lower=0>[2] sigma ; // genetic variance
}
transformed parameters {
  real<lower=0> Vp = variance(mu) ; // population variance
}
model {
  y ~ lognormal(log(mu[population]) + sigma[2]*A*epsilon, sigma[1]) ;
  mu ~ lognormal(0, 1) ;
  epsilon ~ std_normal() ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vg = square(sigma[2]) ;
  real Vr = square(sigma[1]) ;
  real R2m = Vp / (Vp + Vg + Vr) ;
  real R2c = (Vp + Vg) / (Vp + Vg + Vr) ;
}
