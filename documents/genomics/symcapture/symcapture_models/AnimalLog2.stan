data {
  int<lower=0>  N ; // # of individuals
  int<lower=0>  P ; // # of populations
  real y[N] ; // phenotype
  int<lower=1, upper=P> population[N] ; // populations
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] A = cholesky_decompose(K) ; // cholesky-decomposed kinship
  real Vy = variance(log(y)) ;
}
parameters {
  vector<lower=0>[P] mu ; // intercept
  vector[N] epsilon ; // genotypic noise
  real<lower=0, upper=sqrt(Vy)> sigma ; // genetic variance
}
transformed parameters {
  real<lower=0> Vp = variance(log(mu[population])) ; // population variance
  real Vg = square(sigma) ;
  real Vr = Vy - Vp - Vg ;
  vector[N] alog = sigma*A*epsilon ;
}
model {
  y ~ lognormal(log(mu[population]) + alog, sqrt(Vr)) ;
  epsilon ~ std_normal() ;
  mu ~ lognormal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
