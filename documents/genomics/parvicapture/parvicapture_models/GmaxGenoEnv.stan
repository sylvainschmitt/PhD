data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ; // years
  vector[I] DBH0 ; // recruitment DBH
  vector[I] Y0 ; // recruitment year
  vector[I] DBHtoday ; // 2017 DBH
  vector[I] NCI ;
  vector[I] RE ;
  int<lower=1, upper=Y> pop[I] ; // gene pools
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0, upper=1>[P] thetap1 ;
  real<lower=0, upper=1> theta2 ;
  real<lower=0, upper=1> theta3 ;
  vector[2] beta ;
  vector[P] epsilon_p2 ;
  vector[P] epsilon_p3 ;
  vector[I] epsilon_i ;
  vector[I] epsilon_a ; 
  vector<lower=0>[5] sigma ;
}
transformed parameters {
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  vector[I] alog = sigma[5]*A*epsilon_a ; 
  vector[I] thetai1 = exp(log(thetap1[pop]) + 
                                   log(beta[1]*RE) + 
                                   log(beta[2]*NCI) +
                                   alog + 
                                   sigma[2]*epsilon_i) ; 
  vector[P] thetap2 = exp(log(theta2) + sigma[3]*epsilon_p2) ; 
  vector[P] thetap3 = exp(log(theta3) + sigma[4]*epsilon_p3) ; 
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
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma[1]) ;
  epsilon_p2 ~ std_normal() ;
  epsilon_p3 ~ std_normal() ;
  epsilon_i ~ std_normal() ;
  epsilon_a ~ std_normal() ;
  thetap1 ~ lognormal(0, 1) ;
  theta2 ~ lognormal(0, 1) ;
  theta3 ~ lognormal(0, 1) ;
  beta ~ normal(0,1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vp = variance(log(thetap1[pop])) ;
  real Vg = square(sigma[5]) ;
  real Vre = variance(log(beta[1]*RE)) ;
  real Vnci = variance(log(beta[2]*NCI)) ;
  real Vr = square(sigma[2]) ;
}
