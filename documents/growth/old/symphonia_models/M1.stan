data {
  int<lower=0> N ; // # obs
  vector<lower=0>[N] dbh ; // obs
  vector<lower=0>[N] dgaps ; // obs
  vector<lower=0>[N] growth ; // pred
}
parameters {
  real alpha ;
  real beta ;
  real gamma ;
  real<lower=0,upper=10> sigma ;
}
model {
  for(n in 1:N)
    growth[n] ~ lognormal(alpha*log(dgaps[n]+1) + beta*dbh[n] + gamma*log(dgaps[n]+1)*dbh[n], sigma) ;
}
