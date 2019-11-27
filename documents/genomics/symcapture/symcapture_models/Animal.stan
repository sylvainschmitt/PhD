// adapted from https://github.com/diogro/stanAnimal/blob/master/package/src/stan_files/animalModelUni.stan
data {
  int<lower=1> J ; // # of fixed effects (intercept, ontogeny & environment)
  int<lower=0>  N ; // # of individuals
  // vector[J] X[N] ; // Fixed effects matrix
  matrix[J,N] X ; // Fixed effects matrix
  real Y[N] ; // phenotype
  cov_matrix[N] K ; // kinship covariance matrix
}
transformed data{
  matrix[N, N] LK ; // cholesky-decomposed kinship
  real<lower=0> sigma ; // phenotypic variance
  LK = cholesky_decompose(K) ;
  sigma = sd(Y) * sd(Y) ;
}
parameters {
  vector[N]  u_tilde; // random effects / breeding values
  vector[J] beta; // fixed effects (intercept, ontogeny & environment)
  simplex[2] part; // variance partition between environement and genetic
}
model {
    u_tilde ~ normal(0, 1) ; // priors
    to_vector(beta) ~ normal(0, 1) ;
    Y ~ normal(X*beta + sqrt(sigma*part[1])*(LK * u_tilde), sqrt(sigma*part[2]));
}
generated quantities{
  real sigmaE ; // environmental variation
  real sigmaG ; // genetic variation
  sigmaE = sigma*part[2] ;
  sigmaG = sigma*part[1] ;
}
