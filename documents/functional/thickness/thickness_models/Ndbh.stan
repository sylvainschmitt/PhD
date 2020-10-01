data {
  int<lower=1> L ;
  vector[L] LT ;
  vector[L] DBH ;
}
parameters {
  real alpha ;
  real beta_dbh ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha + beta_dbh * DBH, sigma);
}
