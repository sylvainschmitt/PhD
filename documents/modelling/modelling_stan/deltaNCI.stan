data {
  int<lower=0> N;
  int<lower=0, upper=1> NCIdecrease[N];
  vector[N] NCI ;
}
parameters {
  real alpha ;
  real beta ;
}
model {
  NCIdecrease ~ bernoulli_logit(alpha + beta*NCI) ;
}

