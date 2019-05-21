  data {
    int<lower=1> N ; // # obs
    int<lower=0, upper=1> Presence[N] ;
    vector[N] Environment ;
  }
  parameters {
    real alpha_0 ; // intercept
    real alpha ; // sigmoidal slope
    real alpha_2 ; // quadratic form
  }
  model {
    target += bernoulli_logit_lpmf(Presence | alpha_0 + alpha*Environment + alpha_2 * Environment .* Environment) ;
  }
  generated quantities {
    vector<lower=0, upper=1>[N] theta ;
    theta = inv_logit(alpha_0 + alpha * Environment  + alpha_2 * Environment .* Environment) ;
  }
  