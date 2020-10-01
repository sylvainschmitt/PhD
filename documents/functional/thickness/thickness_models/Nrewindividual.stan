data {
  int<lower=1> L ;
  int<lower=1> I ;
  vector[L] LT ;
  vector[L] REW ;
  int<lower=1, upper=I> individual[L] ;
}
parameters {
  real alpha ;
  vector[I] gamma ;
  real beta_rew ;
  real<lower=0> sigma ;
  real<lower=0> sigmaI ;
}
model {
  LT ~ normal(alpha + gamma[individual] + beta_rew * REW, sigma);
  gamma ~ normal(0, sigmaI) ;
}
