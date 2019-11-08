functions {
  real dirac_delta_lpdf(vector y, real alpha) {
    return sum((1/(fabs(alpha)*sqrt(pi())))*exp(-(y/alpha) .* (y/alpha))) ;
  }
}

data {
  int<lower=0> N ; // Nb ind
  int<lower=0> P ; // Nb SNP
  real<lower=0> Preal ; // Nb SNP
  vector[N] y ; // phenotype
  matrix<lower=0, upper=2>[N,P] X ; // SNPs
  matrix[N,N] K ; // kinship
}

parameters {
  real mu ; // mean phenotype
  vector[P] beta_tilde_nonnull ; // non null SNP sparse effect
  vector[P] beta_tilde_null ; // null SNP sparse effect
  real<lower=0, upper=1> pi ; // proportion of non-zero beta
  vector[N] u ; // random effects
  real<lower=0> sigma_a ; // magnitude of non-zero beta
  real<lower=0> sigma_b ; // magnitude of random effect u
  real<lower=0> sigma ; // variance
}

transformed parameters {
  vector[P] beta_tilde ; // SNP sparse effect
  beta_tilde = pi*beta_tilde_nonnull + (1-pi)*beta_tilde_null ;
}

model {
  beta_tilde_nonnull ~ normal(0, sigma_a/(P/sigma)) ;
  beta_tilde_null ~ dirac_delta(10^-6) ;
  u ~ multi_normal(rep_vector(0,N), sigma_b*(1/sigma)*K) ;
  sigma ~ gamma(10^-6, 10^-6) ;
  sigma_a ~ gamma(10^-6, 10^-6) ;
  sigma_b ~ gamma(10^-6, 10^-6) ;
  mu ~ normal(0, 10^6*(1/sigma)) ;
  target += uniform_lpdf(log(pi) | log(1/Preal), log(1)) ;
  y ~ normal(mu + X * beta_tilde + u, sigma);
}
