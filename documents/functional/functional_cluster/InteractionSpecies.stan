data {
  int<lower=1>  N ; // # of observations
  int<lower=1>  J ; // # of neighbors
  int<lower=1> S ; // # species
  vector[N] Trait ; // Trait
  vector[N] DBH ; // Diameter at Breast Height
  vector[N] TWI ; // Topographic Wetness Index
  vector[J] DBHj ; // DBH neighbor
  vector[J] Deltaj ; // Distance neighbor
  vector[N] weights ;
  int<lower=1, upper=N>  individual[J] ; // individuals index in neighbor matrix
  int<lower=1, upper=S> species[N] ; // species index
}
parameters {
  vector [S] alpha ; // Intercept
  vector<lower=0> [S]  betaDBH ; // DBH half-load
  vector[S] betaTWI ; // TWI slope
  vector[S] betaComp ; // Competition slope
  real<lower=0> alphaNCI ;
  real<lower=0> sigma ; // Variance
}
transformed parameters {
  vector[J] NCIj ; // Crowding index
  vector[N] NCI ;
  NCIj = DBHj .* DBHj .* exp(-alphaNCI * Deltaj) ;  // Crowding index
  NCI = rep_vector(0.0, N) ;
  for(j in 1:J)
   NCI[individual[j]] += NCIj[j] ;
  NCI = (1 ./ weights) .* NCI ;
  NCI = NCI ./ sd(NCI) ;
}
model {
  alpha ~ normal(0, 10^6) ; // Priors
  betaDBH ~ lognormal(0,1) ;
  betaTWI ~ normal(0,1) ;
  betaComp ~ normal(0,1) ;
  alphaNCI ~ lognormal(0, 1) ;
  sigma ~ cauchy(0, 5) ;
  Trait ~ normal((alpha[species] + betaTWI[species] .* TWI +  betaComp[species] .* NCI) .* (DBH ./ (betaDBH[species] + DBH)), sigma) ; // Likelihood
}
