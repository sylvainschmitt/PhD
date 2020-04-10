data {
  int<lower=1>  B ; // # of blocks
  int<lower=1>  P ; // # of provenance
  int<lower=1>  G ; // # of genepools
  int<lower=1>  C ; // # of clones
  int<lower=1>  I ; // # of individuals
  int<lower=1>  N ; // # of observation
  vector[N] height ; // height
  vector[N] age ; // age
  vector[N] bio5 ; // bio4
  vector[N] bio14 ; // bio15
  int<lower=1, upper=B> bloc[N] ; // blocks
  int<lower=1, upper=P> provenance[N] ; // provenances
  int<lower=1, upper=C> clone[N] ; // clones
  int<lower=1, upper=I> individual[N] ; // individuals
  matrix[N,G] Q ; // genepool matrix
  cov_matrix[C] K ; // genepool matrix
}
transformed data{
  matrix[C, C] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  real mu ; // intercept
  vector[B]  epsilon_b ; // block noise
  vector[P]  epsilon_p ; // provenance noise
  vector[4]  beta ; // fixed effects
  vector[G]  gamma ; // population fixed effects
  vector[C]  a ; // genotype additive values
  vector<lower=0>[4] sigma ; // variances
}
model {
  log(height) ~ normal(mu + sigma[2]*epsilon_b[bloc] + sigma[3]*epsilon_p[provenance] 
                       + beta[1]*age + beta[2]*square(age)
                       + beta[3]*bio5 + beta[4]*bio14 + Q*gamma +
                       sigma[4]*(A*a)[clone], sigma[1]) ;
  epsilon_b ~ std_normal() ;
  epsilon_p ~ std_normal() ;
  mu ~ normal(0,1) ;
  beta ~ normal(0,1)  ;
  gamma ~ normal(0,1)  ;
  a ~ normal(0,1) ;
  sigma ~ cauchy(0,1) ;
}
generated quantities {
  real Vg = square(sigma[4]) ;
  real Vr = square(sigma[1]) ;
}
