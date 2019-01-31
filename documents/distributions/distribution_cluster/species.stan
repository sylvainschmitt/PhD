functions {
  real dirichlet_multinomial_lpmf(int[] y, vector alpha) {
    real alpha_plus = sum(alpha);
    return lgamma(alpha_plus) + sum(lgamma(alpha + to_vector(y)))
                - lgamma(alpha_plus+sum(y)) - sum(lgamma(alpha));
  }
}
data {
  int<lower = 1> N  ;       // # of individuals
  int<lower = 1> S  ;       // # of species
  int<lower = 0, upper=1> Y[N, S]  ; // individuals presence or absence for each species
  vector[N] TWI ; // Topographical Wetness Index
  vector[N] BA ; // Basal Area
  vector[N] BAgenus ; // Congeneric Basla Area
  vector<lower=0, upper=1>[N] w ; // weights for pseudo-absence to be equal to presence
}
parameters {
  vector[S] alpha ; // intercept
  matrix[S,3] beta ; // sigmoidal slope
  matrix[S,3] gamma ; // quadratic form
}
transformed parameters {
  simplex[S] theta[N] ; // habitat suitability 
  for (n in 1:N)
      theta[n] = softmax(alpha + TWI[n] * beta[,1] + TWI[n] * TWI[n] * gamma[,1] + BA[n] * beta[,2] + BA[n] .* BA[n] * gamma[,2] + BAgenus[n] * beta[,3] + BAgenus[n] .* BAgenus[n] * gamma[,3]) ;
}
model {
  alpha ~ normal(0,1) ;  
  for(k in 1:3){
    beta[,k] ~ normal(0,1) ;
    gamma[,k] ~ normal(0,1) ;
  }
  for (n in 1:N)
    target += w*dirichlet_multinomial_lpmf(Y[n] | theta[n]) ; // likelihood
}
generated quantities {
  simplex[S] thetaTWI[N] ; // habitat suitability per variable
  simplex[S] thetaBA[N] ;
  simplex[S] thetaBAgenus[N] ;
  for(n in 1:N) {
    thetaTWI[n] = softmax(alpha + TWI[n] * beta[,1] + TWI[n] .* TWI[n] * gamma[,1] + mean(BA) * beta[,2] + mean(BA) .* mean(BA) * gamma[,2] + mean(BAgenus) * beta[,3] + mean(BAgenus) .* mean(BAgenus) * gamma[,3]) ;
    thetaBA[n] = softmax(alpha + mean(TWI) * beta[,1] + mean(TWI) .* mean(TWI) * gamma[,1] + BA[n] * beta[,2] + BA[n] .* BA[n] * gamma[,2] + mean(BAgenus) * beta[,3] + mean(BAgenus) .* mean(BAgenus) * gamma[,3]) ;
    thetaBAgenus[n] = softmax(alpha + mean(TWI) * beta[,1] + mean(TWI) .* mean(TWI) * gamma[,1] + mean(BA) * beta[,2] + mean(BA) .* mean(BA) * gamma[,2] + BAgenus[n] * beta[,3] + BAgenus[n] .* BAgenus[n] * gamma[,3]) ;
  }
}
