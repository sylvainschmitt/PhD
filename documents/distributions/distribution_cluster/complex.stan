data {
  int<lower=1> N ;                // # of individuals
  int<lower=0, upper=1> Y[N] ;    // individuals presence or absence (0-1) 
  vector[N] TWI ; // Topographical Wetness Index
  vector[N] BA ; // Basal Area
  vector[N] BAgenus ; // Congeneric Basla Area
  vector<lower=0, upper=1>[N] w ; // weights for pseudo-absence to be equal to presence
}
parameters {
  real alpha ;       // intercept
  vector[3] beta ;   // sigmoidal slope
  vector[3] gamma ;  // quadratic form
}
transformed parameters {
  vector<lower=0, upper=1>[N] theta ; // habitat suitability
  theta = inv_logit(alpha + TWI * beta[1] + TWI .* TWI * gamma[1] + BA * beta[2] + BA .* BA * gamma[2] + BAgenus * beta[3] + BAgenus .* BAgenus * gamma[3]) ;
}
model {
  alpha ~ normal(0, 10^6) ; // priors
  beta ~ normal(0, 10^6) ;
  gamma ~ normal(0, 10^6) ;
  target += w*bernoulli_lpmf(Y | theta) ; // likelihood
}
generated quantities {
  int<lower=0, upper=1> Yp[N] ; // predictions
  vector<lower=0, upper=1>[N] thetaTWI ; // habitat suitability per variable
  vector<lower=0, upper=1>[N] thetaBA ;
  vector<lower=0, upper=1>[N] thetaBAgenus ;
  thetaTWI = inv_logit(alpha + TWI * beta[1] + TWI .* TWI * gamma[1] + mean(BA) * beta[2] + mean(BA) .* mean(BA) * gamma[2] + mean(BAgenus) * beta[3] + mean(BAgenus) .* mean(BAgenus) * gamma[3]) ;
  thetaBA = inv_logit(alpha + mean(TWI) * beta[1] + mean(TWI) .* mean(TWI) * gamma[1] + BA * beta[2] + BA .* BA * gamma[2] + mean(BAgenus) * beta[3] + mean(BAgenus) .* mean(BAgenus) * gamma[3]) ;
  thetaBAgenus = inv_logit(alpha + mean(TWI) * beta[1] + mean(TWI) .* mean(TWI) * gamma[1] + mean(BA) * beta[2] + mean(BA) .* mean(BA) * gamma[2] + BAgenus * beta[3] + BAgenus .* BAgenus * gamma[3]) ;
  for(n in 1:N)
    Yp[n] = bernoulli_rng(theta[n]) ;
}
