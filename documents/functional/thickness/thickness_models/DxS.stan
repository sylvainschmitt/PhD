data {
  int<lower=1> L ;
  int<lower=1> S ;
  vector[L] LT ;
  vector[L] logDBH ;
  int<lower=1, upper=S> species[L] ;
}
parameters {
  real alpha ;
  vector[S] beta_dbh ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha + beta_dbh[species] .* logDBH, sigma);
}
generated quantities {
  matrix[L,S] predicted ;
  for(s in 1:S)
    predicted[,s] = alpha + beta_dbh[s] * logDBH ;
}
