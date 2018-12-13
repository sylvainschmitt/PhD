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
  vector<lower=0> [S] alpha_s ; // Intercept for species
  vector<lower=0> [C] alpha_c ; // Intercept for complexes
  vector<lower=0> [S] betaDBH_s ; // DBH half-load for species
  vector<lower=0> [C]  betaDBH_c ; // DBH half-load for complexes
  vector[S] betaTWI_s ; // Abiotic slope for species
  vector[C] betaTWI_c ; // Abiotic slope for complexes
  vector[S] betaComp_s ; // Biotic slope for species
  vector[C] betaComp_c ; // Biotic slope for complexes
  real<lower=0> alphaNCI ;
  real<lower=0> sigmaIntercept ; // Intercept variance for species
  real<lower=0> sigmaDBH ; // DBH half-load variance for species
  real<lower=0> sigmaTWI ; // Abiotic slope variance for species
  real<lower=0, upper=10> sigmaComp ; // Biotic slope variance for species
  real<lower=0> sigma ; // Variance
}
transformed parameters {
  vector[J] NCIj ;
  vector[N] NCI ;
  NCIj = (DBHj .* DBHj + exp(-alphaNCI * Deltaj)) ;
  NCI = rep_vector(0.0, N) ;
  for(j in 1:J)
   NCI[individual[j]] += NCIj[j] ;
}
model {
  betaDBH_c ~ lognormal(0,1) ;
  alphaNCI ~ lognormal(0, 1) ;
  alpha_s ~ normal(alpha_c[speciesincomplex], sigmaIntercept) ;
  betaDBH_s ~ normal(betaDBH_c[speciesincomplex], sigmaDBH) ;
  betaTWI_s ~ normal(betaTWI_c[speciesincomplex], sigmaTWI) ;
  betaComp_s ~ normal(betaComp_c[speciesincomplex], sigmaComp) ;
  Trait ~ normal(alpha_s[species] .* (DBH ./ (betaDBH_s[species] + DBH)) + betaTWI_s[species] .* TWI +  betaComp_s[species] .* (1 ./ weights) .* NCI, sigma) ; // Likelihood
} 
generated quantities {
  matrix[N,C] Trait_pred ;
  matrix[N,C] Trait_predDBH ;
  matrix[N,C] Trait_predTWI ;
  matrix[N,C] Trait_predNCI ;
  for(c in 1:C) {
    Trait_pred[,c] = alpha_c[c] * (DBH ./ (betaDBH_c[c] + DBH)) + betaTWI_c[c]*TWI  + betaComp_c[c] * (1 ./ weights) .* NCI ;
    Trait_predDBH[,c] = alpha_c[c] * (DBH ./ (betaDBH_c[c] + DBH)) + betaTWI_c[c]*mean(TWI)  + betaComp_c[c] * mean((1 ./ weights) .* NCI) ;
    Trait_predTWI[,c] = alpha_c[c] * (mean(DBH) ./ (betaDBH_c[c] + mean(DBH))) + betaTWI_c[c]*TWI  + betaComp_c[c] * mean((1 ./ weights) .* NCI) ;
    Trait_predNCI[,c] = alpha_c[c] * (mean(DBH) ./ (betaDBH_c[c] + mean(DBH))) + betaTWI_c[c]*mean(TWI)  + betaComp_c[c] * (1 ./ weights) .* NCI ;
  }
}
