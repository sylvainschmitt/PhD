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
  vector [C] alpha_c ; // Intercept for complexes
  vector<lower=0> [C]  betaDBH_c ; // DBH half-load for complexes
  vector[C] betaTWI_c ; // Abiotic slope for complexes
  vector[C] betaComp_c ; // Biotic slope for complexes
  real<lower=0> alphaNCI ;
  vector<lower=0> [S] alpha_s_tilde ; // Intercept for species
  vector<lower=0> [S] betaDBH_s_tilde ; // DBH half-load for species
  vector[S] betaTWI_s_tilde ; // Abiotic slope for species
  vector[S] betaComp_s_tilde ; // Biotic slope for species
  real<lower=0> sigmaIntercept ; // Intercept variance for species
  real<lower=0> sigmaDBH ; // DBH half-load variance for species
  real<lower=0> sigmaTWI ; // Abiotic slope variance for species
  real<lower=0, upper=10> sigmaComp ; // Biotic slope variance for species
  real<lower=0> sigma ; // Variance
}
transformed parameters {
  vector[S] alpha_s ;
  vector<lower=0> [S] betaDBH_s ;
  vector[S] betaTWI_s ;
  vector[S] betaComp_s ;
  vector[J] NCIj ;
  vector[N] NCI ;
  alpha_s = alpha_c[speciesincomplex] + sigmaIntercept*alpha_s_tilde ;
  betaDBH_s = betaDBH_c[speciesincomplex] + sigmaDBH*betaDBH_s_tilde ;
  betaTWI_s = betaTWI_c[speciesincomplex] + sigmaTWI*betaTWI_s_tilde ;
  betaComp_s = betaComp_c[speciesincomplex] + sigmaComp*betaComp_s_tilde ;
  NCIj = (DBHj .* DBHj + exp(-alphaNCI * Deltaj)) ;
  NCI = rep_vector(0.0, N) ;
  for(j in 1:J)
   NCI[individual[j]] += NCIj[j] ;
}
model {
  alpha_c ~ normal(0, 10^6) ;
  betaDBH_c ~ lognormal(0,1) ;
  betaTWI_c ~ normal(0, 10^6) ;
  betaComp_c ~ normal(0, 10^6) ;
  alphaNCI ~ lognormal(0, 1) ;
  alpha_s_tilde ~ normal(0, 1) ;
  betaDBH_s_tilde ~ normal(0, 1) ;
  betaTWI_s_tilde ~ normal(0, 1) ;
  betaComp_s_tilde ~ normal(0, 1) ;
  sigmaIntercept ~ cauchy(0, 1) ;
  sigmaDBH ~ cauchy(0, 1) ;
  sigmaTWI ~ cauchy(0, 1) ;
  sigmaComp ~ cauchy(0, 1) ;
  sigma ~ cauchy(0, 5) ;
  Trait ~ normal((alpha_s[species] + betaTWI_s[species] .* TWI +  betaComp_s[species] .* (1 ./ weights) .* NCI) .* (DBH ./ (betaDBH_s[species] + DBH)), sigma) ; // Likelihood
} 
generated quantities {
  vector[N] Trait_pred ;
  real Rsquared ;
  vector[N] Trait_predDBH ;
  vector[N] Trait_predTWI ;
  vector[N] Trait_predNCI ;
  Trait_pred = (alpha_c[complex] + betaTWI_c[complex] .* TWI + betaComp_c[complex] .* (1 ./ weights) .* NCI) .* (DBH ./ (betaDBH_c[complex] + DBH));
  Rsquared = 1 - dot_self(Trait - Trait_pred)/dot_self(Trait - mean(Trait)) ;
  Trait_predDBH = (alpha_c[complex] + betaTWI_c[complex] * mean(TWI) + betaComp_c[complex] * mean((1 ./ weights) .* NCI)) .* (DBH ./ (betaDBH_c[complex] + DBH)) ;
  Trait_predTWI = (alpha_c[complex] + + betaTWI_c[complex] .* TWI + betaComp_c[complex] * mean((1 ./ weights) .* NCI)) .* (mean(DBH) ./ (betaDBH_c[complex] + mean(DBH))) ;
  Trait_predNCI = (alpha_c[complex] + betaTWI_c[complex] * mean(TWI) + betaComp_c[complex] .* (1 ./ weights) .* NCI) .* (mean(DBH) ./ (betaDBH_c[complex] + mean(DBH))) ;
}
