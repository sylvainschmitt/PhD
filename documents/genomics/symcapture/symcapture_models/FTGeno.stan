data {
  int<lower=1> I ; // # individuals
  int<lower=1> P ; // # species / population p in document
  int<lower=1> Pl ; // # plots
  vector[I] Trait ; // Trait
  vector[I] DBH ; // Diameter at Breast Height
  int<lower=1, upper=P> population[I] ; // species index
  int<lower=1, upper=Pl> plot[I] ; // plot index
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0>[P] alpha ; // population intercept
  vector[I] epsilon_a ; // genotypic noise
  vector[Pl] epsilon_p ; // plot noise
  vector<lower=0> [P]  betaDBH ; // DBH half-load
  vector<lower=0>[3] sigma ;
}
transformed parameters {
  vector[I] alog = sigma[2]*A*epsilon_a ;
  vector[Pl] deltalog = sigma[3]*epsilon_p ;
}
model {
  Trait ~ lognormal(log(alpha[population]) +
                    alog + 
                    deltalog[plot] +
                    log(DBH ./ (betaDBH[population] + DBH)), 
                    sigma[1]) ; // Likelihood
  epsilon_a ~ std_normal() ;
  epsilon_p ~ std_normal() ;
  betaDBH ~ lognormal(0,1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vp = variance(log(alpha[population])) ;
  real Vg = square(sigma[2]) ;
  real Vdbh = variance(log(DBH ./ (betaDBH[population] + DBH))) ;
  real Vplot = square(sigma[3]) ;
  real Vr = square(sigma[1]) ;
}
