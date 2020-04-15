data {
  int<lower=1> I ; // # individuals
  int<lower=1> S ; // # species
  int<lower=1> P ; // # plots
  vector[I] Trait ; // Trait
  vector[I] DBH ; // Diameter at Breast Height
  int<lower=1, upper=S> species[I] ; // species index
  int<lower=1, upper=P> plot[I] ; // plot index
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0>[S] alpha ; // species intercept
  vector[I] epsilon_a ; // genotypic noise
  vector[P] epsilon_p ; // plot noise
  vector<lower=0> [S]  betaDBH ; // DBH half-load
  vector<lower=0>[3] sigma ;
}
transformed parameters {
  real<lower=0> Vs = variance(alpha) ;
}
model {
  Trait ~ lognormal(log((exp(log(alpha[species]) + 
                             sigma[2]*A*epsilon_a) +  
                             sigma[3]*A*epsilon_p[plot]) .* 
                        (DBH ./ (betaDBH[species] + DBH))), 
                        sigma[1]) ; // Likelihood
  epsilon_a ~ std_normal() ;
  epsilon_p ~ std_normal() ;
  betaDBH ~ lognormal(0,1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vg = square(sigma[2]) ;
  real Vp = square(sigma[3]) ;
  real Vr = square(sigma[1]) ;
}
