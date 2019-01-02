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
transformed data {
  vector[N] Trait_sd ;  // Reducing continuous descriptors
  vector[N] DBH_sd ;
  vector[N] TWI_sd ;
  vector[J] DBHj_sd ;
  vector[J] Deltaj_sd ;
  Trait_sd = Trait ./ sd(Trait) ;
  DBH_sd = DBH ./ sd(DBH) ;
  TWI_sd = TWI ./ sd(TWI) ;
  DBHj_sd = DBHj ./ sd(DBHj) ;
  Deltaj_sd = Deltaj ./ sd(Deltaj) ;
}
parameters {
  vector<lower=0> [C] alpha_sd_c ; // Intercept for complexes
  vector<lower=0> [C] betaDBH_sd_c ; // DBH half-load for complexes
  vector[C] betaTWI_sd_c ; // Abiotic slope for complexes
  vector[C] betaComp_sd_c ; // Biotic slope for complexes
  real<lower=0> alphaNCI_sd ;
  vector<lower=0> [S] alpha_sd_s_tilde ; // Intercept for species
  vector<lower=0> [S] betaDBH_sd_s_tilde ; // DBH half-load for species
  vector[S] betaTWI_sd_s_tilde ; // Abiotic slope for species
  vector[S] betaComp_sd_s_tilde ; // Biotic slope for species
  real<lower=0> sigmaIntercept_sd ; // Intercept variance for species
  real<lower=0> sigmaDBH_sd ; // DBH half-load variance for species
  real<lower=0> sigmaTWI_sd ; // Abiotic slope variance for species
  real<lower=0> sigmaComp_sd ; // Biotic slope variance for species
  real<lower=0> sigma_sd ; // Variance
}
transformed parameters {
  vector<lower=0>[S] alpha_sd_s ; // Non centered random effect
  vector<lower=0> [S] betaDBH_sd_s ;
  vector[S] betaTWI_sd_s ;
  vector[S] betaComp_sd_s ;
  vector[J] NCIj ; // Competition Index
  vector[N] NCI ;
  vector[N] NCI_sd ;
  vector<lower=0> [C]  alpha_c ; // True values of parameters
  vector<lower=0> [C]  betaDBH_c ;
  vector<lower=0> [C]  DBH90 ;
  vector[C] betaTWI_c ;
  vector[C] betaComp_c ;
  real<lower=0> alphaNCI ;
  real<lower=0> sigmaIntercept ;
  real<lower=0> sigmaDBH ;
  real<lower=0> sigmaTWI ;
  real<lower=0> sigmaComp ;
   real<lower=0> sigma ;
  alpha_sd_s = alpha_sd_c[speciesincomplex] + sigmaIntercept_sd*alpha_sd_s_tilde ; // Non centered random effect
  betaDBH_sd_s = betaDBH_sd_c[speciesincomplex] + sigmaDBH_sd*betaDBH_sd_s_tilde ;
  betaTWI_sd_s = betaTWI_sd_c[speciesincomplex] + sigmaTWI_sd*betaTWI_sd_s_tilde ;
  betaComp_sd_s = betaComp_sd_c[speciesincomplex] + sigmaComp_sd*betaComp_sd_s_tilde ;
  NCIj = DBHj_sd .* DBHj_sd .* exp(-alphaNCI_sd * Deltaj_sd) ; // Competition Index
  NCI = rep_vector(0.0, N) ;
  for(j in 1:J)
   NCI[individual[j]] += NCIj[j] ;
  NCI_sd = NCI ./ sd(NCI) ;
  alpha_c = sd(Trait) * alpha_sd_c ; // True values of parameters
  betaDBH_c = sd(DBH) * betaDBH_sd_c ;
  DBH90 = 9 * betaDBH_c ;
  betaTWI_c = sd(TWI) * betaTWI_sd_c ;
  betaComp_c = sd(NCI) * betaComp_sd_c ;
  alphaNCI = sd(Deltaj_sd) * alphaNCI_sd ;
  sigmaIntercept = sd(Trait) * sigmaIntercept_sd ;
  sigmaDBH = sd(DBH) * sigmaDBH_sd ;
  sigmaTWI = sd(TWI) * sigmaTWI_sd ;
  sigmaComp = sd(NCI) * sigmaComp_sd ;
  sigma = sd(Trait) * sigma_sd ;
}
model {
  alpha_sd_c ~ lognormal(0,1) ;
  betaDBH_sd_c ~ lognormal(0,1) ;
  betaTWI_sd_c ~ normal(0, 10^6) ;
  betaComp_sd_c ~ normal(0, 10^6) ;
  alphaNCI_sd ~ lognormal(0, 1) ;
  alpha_sd_s_tilde ~ normal(0, 1) ;
  betaDBH_sd_s_tilde ~ normal(0, 1) ;
  betaTWI_sd_s_tilde ~ normal(0, 1) ;
  betaComp_sd_s_tilde ~ normal(0, 1) ;
  sigmaIntercept_sd ~ lognormal(0, 1) ;
  sigmaDBH_sd ~ lognormal(0, 1) ;
  sigmaTWI_sd ~ lognormal(0, 1) ;
  sigmaComp_sd ~ lognormal(0, 1) ;
  sigma_sd ~ cauchy(0, 5) ;
  Trait_sd ~ lognormal((alpha_sd_s[species] + betaTWI_sd_s[species] .* TWI_sd +  betaComp_sd_s[species] .* (1 ./ weights) .* NCI_sd) .* (DBH_sd ./ (betaDBH_sd_s[species] + DBH_sd)), sigma_sd) ; // Likelihood
} 
generated quantities {
  vector[N] Trait_pred ;
  vector[N] Trait_predDBH ;
  vector[N] Trait_predTWI ;
  vector[N] Trait_predNCI ;
  Trait_pred = (alpha_c[complex] + betaTWI_c[complex] .* TWI + betaComp_c[complex] .* (1 ./ weights) .* NCI) .* (DBH ./ (betaDBH_c[complex] + DBH));
  Trait_predDBH = (alpha_c[complex] + betaTWI_c[complex] * mean(TWI) + betaComp_c[complex] * mean((1 ./ weights) .* NCI)) .* (DBH ./ (betaDBH_c[complex] + DBH)) ;
  Trait_predTWI = (alpha_c[complex] + + betaTWI_c[complex] .* TWI + betaComp_c[complex] * mean((1 ./ weights) .* NCI)) .* (mean(DBH) ./ (betaDBH_c[complex] + mean(DBH))) ;
  Trait_predNCI = (alpha_c[complex] + betaTWI_c[complex] * mean(TWI) + betaComp_c[complex] .* (1 ./ weights) .* NCI) .* (mean(DBH) ./ (betaDBH_c[complex] + mean(DBH))) ;
}
