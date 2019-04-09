data {
  int<lower=0> N ; // # obs
  vector<lower=0>[N] dbh ; // obs
  vector<lower=0>[N] dgaps ; // obs
  vector<lower=0>[N] growth ; // pred
}
parameters {
  real alpha ;
  real beta ;
  real<lower=0,upper=10> sigma ;
}
model {
  growth ~ lognormal(alpha*dgaps + beta*dbh, sigma) ;
}
