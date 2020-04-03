data {
  int<lower=1> I ; // # individuals
  int<lower=1> S ; // # species
  int<lower=1> P ; // # plots
  vector[I] Trait ; // Trait
  vector[I] DBH ; // Diameter at Breast Height
  vector[I] TWI ; // Topographic Wetness Index
  vector[I] NCI ; // Neighbor Crowding Index
  int<lower=1, upper=S> species[I] ; // species index
  int<lower=1, upper=P> plot[I] ; // plot index
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0>[S] alpha_s ;
  vector[I] epsilon ; // individual random effect
  vector<lower=0> [S]  betaDBH ; // DBH half-load
  real betaTWI ;
  real betaNCI ;
  vector[P] delta ;
  real<lower=0> sigmaP ;
  real<lower=0> sigmaG ;
  real<lower=0> sigmaR ;
}
transformed parameters {
  real<lower=0> Vs = variance(alpha_s) ;
  vector<lower=0>[I] alpha_i  = exp(log(alpha_s[species]) + sigmaG*epsilon) ;
}
model {
  Trait ~ lognormal(log((A*alpha_i +  delta[plot] + betaTWI*TWI + betaNCI*NCI) .* 
                        (DBH ./ (betaDBH[species] + DBH))), 
                        sigmaR) ; // Likelihood
  epsilon ~ std_normal() ;
  betaDBH ~ lognormal(0,1) ;
  delta ~ normal(0, sigmaP) ;
  sigmaP ~ normal(0, 1) ;
  sigmaG ~ normal(0, 1) ;
  sigmaR ~ normal(0, 1) ;
}
generated quantities{
  real Vg = variance(log(alpha_i) - log(alpha_s[species])) ;
  real Vdbh = variance(log((DBH ./ (betaDBH[species] + DBH)))) ;
  // real Vtwi = variance(log(betaTWI*TWI)) ;
  // real Vnci = variance(log(betaNCI*NCI)) ;
  real Vp = variance(delta) ;
  real Vr = variance(log(Trait) - log((A*alpha_i +  delta[plot] + betaTWI*TWI + betaNCI*NCI) .* (DBH ./ (betaDBH[species] + DBH)))) ;
}
