data {
  int<lower=1> L ;
  int<lower=1> S ;
  int<lower=1> I ;
  vector[L] LT ;
  vector[L] REW ;
  vector[L] logDBH ;
  int<lower=1, upper=S> species[L] ;
  int<lower=1, upper=I> individual[L] ;
}
parameters {
  vector[S] alpha ;
  vector[I] gamma ;
  vector[S] beta_rew ;
  real beta_dbh ;
  real<lower=0> sigma ;
  real<lower=0> sigmaI ;
}
model {
  LT ~ normal(alpha[species] + gamma[individual] + beta_rew[species] .* REW + beta_dbh * logDBH, sigma) ;
  gamma ~ normal(0, sigmaI) ;
}
generated quantities {
  real Vspecies = variance(alpha[species]) ;
  real Vindividual = variance(gamma[individual]) ;
  real Vrew = variance(beta_rew[species] .* REW) ;
  real Vdbh = variance(beta_dbh * logDBH) ;
  real Vresidual = variance(LT) - variance(alpha[species] + gamma[individual] + beta_rew[species] .* REW + beta_dbh * logDBH) ;
  matrix[L,S] predicted ;
  for(s in 1:S)
    predicted[,s] = alpha[s] + beta_rew[s] * REW + beta_dbh * mean(logDBH) ;
}
