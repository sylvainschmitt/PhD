data {
    int<lower=1> N ; // # obs
    int<lower=0, upper=1> Presence[N] ;
  }
  parameters {
    real alpha_0 ;
  }
  model {
    target += bernoulli_logit_lpmf(Presence | alpha_0) ;
  }
  generated quantities {
    vector<lower=0, upper=1>[N] theta ;
    for(n in 1:N)
       theta[n] = inv_logit(alpha_0) ;
  }
  