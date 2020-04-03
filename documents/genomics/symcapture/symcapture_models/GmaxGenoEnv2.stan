data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ;
  vector[I] DBH0 ;
  vector[I] Y0 ;
  vector[I] DBHtoday ;
  vector[I] NCI ;
  vector[I] TWI ;
  int<lower=1, upper=Y> pop[I] ; // gene pools
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0, upper=1>[P] thetap1 ;
  vector[P] betaTWIp ;
  vector[P] betaNCIp ;
  real<lower=0, upper=1> theta2 ;
  real<lower=0, upper=1> theta3 ;
  vector[P] epsilon_p2 ;
  vector[P] epsilon_p3 ;
  vector[I] epsilon_i ;
  vector[I] epsilon_a ; 
  real<lower=0> sigmaP2 ;
  real<lower=0> sigmaP3 ;
  real<lower=0> sigmaG ;
  real<lower=0> sigmaR ;
  real<lower=0> sigma ;
}
transformed parameters {
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  real<lower=0> Vp = variance(thetap1) ;
  vector<lower=0>[I] a = exp(log(thetap1[pop]) + sigmaG*epsilon_a) ; 
  vector<lower=0>[I] thetai1 = exp(log(A*a + betaNCIp[pop] .* NCI + betaTWIp[pop] .* TWI) + sigmaR*epsilon_i) ; 
  vector<lower=0>[P] thetap2 = exp(log(theta2) + sigmaP2*epsilon_p2) ; 
  vector<lower=0>[P] thetap3 = exp(log(theta3) + sigmaP3*epsilon_p3) ; 
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += thetai1 .* exp(-0.5* square(log(DBH ./ (100*thetap2[pop])) ./ thetap3[pop])) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma) ;
  thetap1 ~ lognormal(0, 1) ;
  theta2 ~ lognormal(0, 1) ;
  theta3 ~ lognormal(0, 1) ;
  epsilon_p2 ~ std_normal() ;
  epsilon_p3 ~ std_normal() ;
  epsilon_i ~ std_normal() ;
  epsilon_a ~ std_normal() ;
  sigmaP2 ~ normal(0, 1) ;
  sigmaP3 ~ normal(0, 1) ;
  sigmaG ~ normal(0, 1) ;
  sigmaR ~ normal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vg = variance(log(a) - log(thetap1[pop])) ;
  real Vnci = variance(log(A*a + betaNCIp[pop] .* NCI + betaTWIp[pop] .* TWI) - log(A*a + betaTWIp[pop] .* TWI)) ;
  real Vtwi = variance(log(A*a + betaNCIp[pop] .* NCI + betaTWIp[pop] .* TWI) - log(A*a + betaNCIp[pop] .* NCI)) ;
  real Vr = variance(to_vector(log(thetai1)) - log(A*a + betaNCIp[pop] .* NCI + betaTWIp[pop] .* TWI)) ;
}
