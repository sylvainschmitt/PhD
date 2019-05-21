  data {
    int<lower=1> N ; // # obs
    int<lower=0, upper=1> Presence[N] ;
    vector[N] Environment ;
  }
  parameters {
    real alpha_0 ; // Intercept
    real alpha ; // sigmoidal slope
  }
  model {
    target += bernoulli_logit_lpmf(Presence | alpha_0 + alpha*Environment) ;
  }
  generated quantities {
    vector<lower=0, upper=1>[N] theta ;
    theta = inv_logit(alpha_0 + alpha*Environment) ;
  }
  