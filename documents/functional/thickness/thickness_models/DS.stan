data {
  int<lower=1> L ;
  int<lower=1> S ;
  vector[L] LT ;
  vector[L] logDBH ;
  int<lower=1, upper=S> species[L] ;
}
parameters {
  vector[S] alpha ;
  real beta_dbh ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha[species] + beta_dbh * logDBH, sigma);
}
generated quantities {
  matrix[L,S] predicted ;
  for(s in 1:S)
    predicted[,s] = alpha[s] + beta_dbh * logDBH ;
}
