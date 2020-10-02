data {
  int<lower=1> L ;
  int<lower=1> S ;
  vector[L] LT ;
  vector[L] REW ;
  int<lower=1, upper=S> species[L] ;
}
parameters {
  vector[S] alpha ;
  vector[S] beta_rew ;
  real<lower=0> sigma ;
}
model {
  LT ~ normal(alpha[species] + beta_rew[species] .* REW, sigma);
}
generated quantities {
  matrix[L,S] predicted ;
  for(s in 1:S)
    predicted[,s] = alpha[s] + beta_rew[s] * REW ;
}
