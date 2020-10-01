data {
  int<lower=1> L ;
  vector[L] LT ;
  vector[L] REW ;
}
parameters {
  real alpha ;
  real beta_rew ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha + beta_rew * REW, sigma);
}
