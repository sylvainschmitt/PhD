data {
  int<lower=1>  N ; // # observations
  int<lower=1> S ; // # species
  int<lower=1> P ; // # plots
  vector[N] Trait ; // Trait
  vector[N] DBH ; // Diameter at Breast Height
  vector[S] TWIs ; // Topographic Wetness Index of species
  vector[N] TWIis ; // Topographic Wetness Index of individual knowing species TWI_i|s
  int<lower=1, upper=S> species[N] ; // species index
  int<lower=1, upper=P> plot[N] ; // species index
}
parameters {
  real alpha ; // genus intercept
  vector [S] alpha_s ; // species intercepts
  vector<lower=0> [S]  betaDBH ; // DBH half-load
  real betaTWI ; // individual TWI slope
  vector[S] gammaTWI ; // species TWI slopee
  vector[P] delta ; // plot random effect
  real<lower=0> sigma_a ; // Variance of the species intercepts
  real<lower=0> sigma_p ; // Variance of the species intercepts
  real<lower=0> sigma_t ; // Variance
}
model {
  Trait ~ normal((alpha_s[species] + betaTWI*TWIs[species] +  gammaTWI[species] .* TWIis) .* (DBH ./ (betaDBH[species] + DBH)) + delta[plot], sigma_a) ; // Likelihood
  alpha_s ~ normal(alpha, sigma_a) ;
  delta ~ normal(0, sigma_p) ;
  alpha ~ normal(0, 1) ;
  betaDBH ~ normal(0,1) ;
  betaTWI ~ normal(0,1) ;
  gammaTWI ~ normal(0,1) ;
  sigma_a ~ normal(0, 1) ;
  sigma_p ~ normal(0, 1) ;
  sigma_t ~ normal(0, 1) ;
}
