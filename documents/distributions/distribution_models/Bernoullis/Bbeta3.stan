  data {
    int<lower=1> N ; // # obs
    int<lower=0, upper=1> Presence[N] ;
    vector[N] Environment ;
  }
  parameters {
    real alpha_0 ; // intercept
    real<lower=0, upper=4> beta ; // second power form
    real<lower=0, upper=beta> alpha ; // first power form
  }
  model {
    for(n in 1:N)
      target += bernoulli_logit_lpmf(Presence[n] | alpha_0 + pow(Environment[n], alpha) + pow(Environment[n], beta)) ;
  }
  generated quantities {
    vector<lower=0, upper=1>[N] theta ;
    for(n in 1:N)
      theta[n] = inv_logit(alpha_0 + pow(Environment[n], alpha) + pow(Environment[n], beta)) ;
  }
  