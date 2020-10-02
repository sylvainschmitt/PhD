data {
  int<lower=1> L ;
  vector[L] LT ;
  vector[L] logDBH ;
}
parameters {
  real alpha ;
  real beta_dbh ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha + beta_dbh * logDBH, sigma);
}
generated quantities {
  vector[L] predicted = alpha + beta_dbh * logDBH ;
}
