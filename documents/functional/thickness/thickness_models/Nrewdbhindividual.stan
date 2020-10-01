data {
  int<lower=1> L ;
  int<lower=1> I ;
  vector[L] LT ;
  vector[L] REW ;
  vector[L] DBH ;
  int<lower=1, upper=I> individual[L] ;
}
parameters {
  real alpha ;
  vector[I] gamma ;
  real beta_rew ;
  real beta_dbh ;
  real<lower=0> sigma ;
  real<lower=0> sigmaI ;
}
model {
  LT ~ normal(alpha + gamma[individual] + beta_rew * REW + beta_dbh * DBH, sigma);
  gamma ~ normal(0, sigmaI) ;
}
