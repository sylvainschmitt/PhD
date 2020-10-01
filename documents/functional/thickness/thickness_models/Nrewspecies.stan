data {
  int<lower=1> L ;
  int<lower=1> S ;
  vector[L] LT ;
  vector[L] REW ;
  int<lower=1, upper=S> species[L] ;
}
parameters {
  vector[S] alpha ;
  real beta_rew ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha[species] + beta_rew * REW, sigma);
}
