data {
  int<lower=1>  B ; // # of blocks
  int<lower=1>  P ; // # of provenance
  int<lower=1>  G ; // # of genepools
  int<lower=1>  C ; // # of clones
  int<lower=1>  I ; // # of individuals
  int<lower=1>  N ; // # of observation
  real height[N] ; // height
  vector[N] age ; // age
  vector[N] bio5 ; // bio4
  vector[N] bio14 ; // bio15
  int<lower=1, upper=B> bloc[N] ; // blocks
  int<lower=1, upper=P> provenance[N] ; // provenances
  int<lower=1, upper=C> clone[N] ; // clones
  int<lower=1, upper=I> individual[N] ; // individuals
  matrix[N,G] Q ; // genepool matrix
}
parameters {
  real mu ; // intercept
  vector[P]  epsilon ; // block noise
  vector[2]  beta ; // fixed effects: age, age2
  vector<lower=0>[2] sigma ; // random effects and residual variances
}
model {
  epsilon ~ std_normal() ;
  log(height) ~ normal(mu + sigma[2]*epsilon[provenance] + beta[1]*age + beta[2]*square(age), sigma[1]) ;
  mu ~ normal(0,1) ;
  beta ~ normal(0,1)  ;
  sigma ~ cauchy(0,1) ;
}
