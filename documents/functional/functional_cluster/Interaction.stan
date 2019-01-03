data {
  int<lower=1>  N ; // # of observations
  int<lower=1>  J ; // # of neighbors
  int<lower=1> S ; // # species
  int<lower=1> C ; // # complex
  vector[N] Trait ; // Trait
  vector[N] DBH ; // Diameter at Breast Height
  vector[N] TWI ; // Topographic Wetness Index
  vector[J] DBHj ; // DBH neighbor
  vector[J] Deltaj ; // Distance neighbor
  vector[N] weights ;
  int<lower=1, upper=N>  individual[J] ; // individuals index in neighbor matrix
  int<lower=1, upper=S> species[N] ; // species index
  int<lower=1, upper=C> speciesincomplex[S] ; // species index wihtin complex
  int<lower=1, upper=C> complex[N] ; // species index
}
parameters {
  vector [C] alpha ; // Intercept for complexes
  vector<lower=0> [C]  betaDBH ; // DBH half-load for complexes
  vector[C] betaTWI ; // TWI slope for complexes
  vector[C] betaComp ; // Competition slope for complexes
  real<lower=0> alphaNCI ;
  vector<lower=0> [S] alpha_s_tilde ; // Intercept for species
  vector<lower=0> [S] betaDBH_s_tilde ; // DBH half-load for species
  vector[S] betaTWI_s_tilde ; // TWI slope for species
  vector[S] betaComp_s_tilde ; // Competition slope for species
  real<lower=0> sigmaIntercept ; // Intercept variance for species
  real<lower=0> sigmaDBH ; // DBH half-load variance for species
  real<lower=0> sigmaTWI ; // TWI slope variance for species
  real<lower=0> sigmaComp ; // Competition slope variance for species
  real<lower=0> sigma ; // Variance
}
transformed parameters {
  vector[S] alpha_s ; // Species uncentered effects
  vector<lower=0> [S] betaDBH_s ;
  vector[S] betaTWI_s ;
  vector[S] betaComp_s ;
  vector[J] NCIj ; // Crowding index
  vector[N] NCI ;
  alpha_s = alpha[speciesincomplex] + sigmaIntercept*alpha_s_tilde ;  // Species uncentered effects
  betaDBH_s = betaDBH[speciesincomplex] + sigmaDBH*betaDBH_s_tilde ;
  betaTWI_s = betaTWI[speciesincomplex] + sigmaTWI*betaTWI_s_tilde ;
  betaComp_s = betaComp[speciesincomplex] + sigmaComp*betaComp_s_tilde ;
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
  betaTWI ~ normal(0, 10^6) ;
  betaComp ~ normal(0, 10^6) ;
  alphaNCI ~ lognormal(0, 1) ;
  alpha_s_tilde ~ normal(0, 1) ;
  betaDBH_s_tilde ~ normal(0, 1) ;
  betaTWI_s_tilde ~ normal(0, 1) ;
  betaComp_s_tilde ~ normal(0, 1) ;
  sigmaIntercept ~ lognormal(0, 1) ;
  sigmaDBH ~ lognormal(0, 1) ;
  sigmaTWI ~ lognormal(0, 1) ;
  sigmaComp ~ lognormal(0, 1) ;
  sigma ~ cauchy(0, 5) ;
  Trait ~ normal((alpha_s[species] + betaTWI_s[species] .* TWI +  betaComp_s[species] .* NCI) .* (DBH ./ (betaDBH_s[species] + DBH)), sigma) ; // Likelihood
} 
generated quantities {
  vector[N] Trait_pred ; // Predictions
  real Rsquared ;
  vector[N] Trait_predDBH ;
  vector[N] Trait_predTWI ;
  vector[N] Trait_predNCI ;
  Trait_pred = (alpha_c[complex] + betaTWI_c[complex] .* TWI + betaComp_c[complex] .* NCI) .* (DBH ./ (betaDBH_c[complex] + DBH));
  Trait_predDBH = (alpha_c[complex] + betaTWI_c[complex] * mean(TWI) + betaComp_c[complex] * mean(NCI)) .* (DBH ./ (betaDBH_c[complex] + DBH)) ;
  Trait_predTWI = (alpha_c[complex] + + betaTWI_c[complex] .* TWI + betaComp_c[complex] * mean(NCI)) .* (mean(DBH) ./ (betaDBH_c[complex] + mean(DBH))) ;
  Trait_predNCI = (alpha_c[complex] + betaTWI_c[complex] * mean(TWI) + betaComp_c[complex] .* NCI) .* (mean(DBH) ./ (betaDBH_c[complex] + mean(DBH))) ;
}
