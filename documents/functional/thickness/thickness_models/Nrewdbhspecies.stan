data {
  int<lower=1> L ;
  int<lower=1> S ;
  vector[L] LT ;
  vector[L] REW ;
  vector[L] DBH ;
  int<lower=1, upper=S> species[L] ;
}
parameters {
  vector[S] alpha ;
  real beta_rew ;
  real beta_dbh ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha[species] + beta_rew * REW + beta_dbh * DBH, sigma);
}
generated quantities {
  real Vrew = variance(beta_rew * REW) ;
  real Vdbh = variance(beta_dbh * DBH) ;
  real Vspecies = variance(alpha[species]) ;
  real Vresidual = variance(LT) - variance(alpha[species] + beta_rew * REW + beta_dbh * DBH) ;
}
