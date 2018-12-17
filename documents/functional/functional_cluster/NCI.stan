data {
  int<lower=1>  N ; // # of observations
  int<lower=1>  J ; // # of neighbors
  int<lower=1> S ; // # of species
  int<lower=1> C ; // # of complexes
  vector[N] Trait ; // Trait
  vector[J] DBHj ; // DBH neighbor
  vector[J] Deltaj ; // Distance neighbor
  int<lower=1, upper=N>  individual[J] ; // individuals index in neighbor matrix
  int<lower=1, upper=S> species[N] ; // species index
  int<lower=1, upper=C> speciesincomplex[S] ; // species index wihtin complex
  int<lower=1, upper=C> complex[N] ; // species index
  vector[N] weights ;
}
parameters {
  vector[C] alpha_c ; // Intercept for complexes
  vector[C] betaComp_c ; // Biotic slope for complexes
  real<lower=0> alphaNCI ;
  vector[S] alpha_s_tilde ; // Intercept for species
  vector[S] betaComp_s_tilde ; // Biotic slope for species
  real<lower=0> sigmaIntercept ; // Intercept variance for species
  real<lower=0> sigmaComp ; // Biotic slope variance for species
  real<lower=0> sigma ;
}
transformed parameters {
  vector[S] alpha_s ;
  vector[S] betaComp_s ;
  vector[J] NCIj ;
  vector[N] NCI ;
  alpha_s = alpha_c[speciesincomplex] + sigmaIntercept*alpha_s_tilde ;
  betaComp_s = betaComp_c[speciesincomplex] + sigmaComp*betaComp_s_tilde ;
  NCIj = (DBHj .* DBHj + exp(-alphaNCI * Deltaj)) ;
  NCI = rep_vector(0.0, N) ;
  for(j in 1:J)
   NCI[individual[j]] += NCIj[j] ;
}
model {
  alpha_c ~ normal(0, 10^6) ;
  betaComp_c ~ normal(0, 10^6) ;
  alphaNCI ~ lognormal(0, 1) ;
  alpha_s_tilde ~ normal(0, 1) ;
  betaComp_s_tilde ~ normal(0, 1) ;
  sigmaIntercept ~ cauchy(0, 1) ;
  sigmaComp ~ cauchy(0, 1) ;
  sigma ~ cauchy(0, 5) ;
  Trait ~ normal(alpha_s[species] +  betaComp_s[species] .* (1 ./ weights) .* NCI, sigma) ; // Likelihood
}
generated quantities {
  matrix[N,C] Trait_pred ;
  for(c in 1:C)
    Trait_pred[,c] = alpha_c[c] + betaComp_c[c] * (1 ./ weights) .* NCI ; // Predictions
}
