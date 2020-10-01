data {
  int<lower=1> L ;
  int<lower=1> I ;
  int<lower=1> S ;
  vector[L] LT ;
  vector[L] REW ;
  vector[L] DBH ;
  int<lower=1, upper=S> species[L] ;
  int<lower=1, upper=I> individual[L] ;
}
parameters {
  vector[S] alpha ;
  vector[I] gamma ;
  real beta_rew ;
  real beta_dbh ;
  real<lower=0> sigma ;
  real<lower=0> sigmaI ;
}
model {
  LT ~ normal(alpha[species] + gamma[individual] + beta_rew * REW + beta_dbh * DBH, sigma);
  gamma ~ normal(0, sigmaI) ;
}
generated quantities {
  real Vrew = variance(beta_rew * REW) ;
  real Vdbh = variance(beta_dbh * DBH) ;
  real Vspecies = variance(alpha[species]) ;
  real Vindividual = variance(gamma[individual]) ;
  real Vresidual = variance(LT) - variance(alpha[species] + gamma[individual] + beta_rew * REW + beta_dbh * DBH) ;
}