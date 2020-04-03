data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ;
  vector[I] DBH0 ;
  vector[I] Y0 ;
  vector[I] DBHtoday ;
  int<lower=1, upper=Y> pop[I] ; // gene pools
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A = cholesky_decompose(K) ;
}
parameters {
  matrix<lower=0.1, upper=1>[P,3] theta ;
  matrix[I, 3] epsilon_t ;
  matrix[I, 3] epsilon_a ; 
  vector<lower=0>[3] sigmaR ;
  vector<lower=0>[3] sigmaG ;
  real<lower=0> sigma ;
}
transformed parameters {
  vector<lower=0>[3] Vp = [variance(theta[,1]), 
                               variance(theta[,2]), 
                               variance(theta[,3])]';
  matrix<lower=0>[I, 3] a ; 
  matrix<lower=0>[I, 3] thetai ; 
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  for(p in 1:3){
    a[,p] = exp(log(theta[pop,p]) + sigmaG[p]*epsilon_a[,p]) ;
    thetai[,p] = exp(log(A*a[,p]) + sigmaR[p]*epsilon_t[,p]) ;
  } 
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += thetai[,1] .* exp(-0.5* square(log(DBH ./ (100*thetai[,2])) ./ thetai[,3])) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma) ;
  for(p in 1:3){
    epsilon_t[,p] ~ std_normal() ;
    epsilon_a[,p] ~ std_normal() ;
    theta[,p] ~ lognormal(0, 1) ;
  }
  sigmaG ~ normal(0, 1) ;
  sigmaR ~ normal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  vector[3] Vg ;
  vector[3] Vr ;
  vector[3] R2m ;
  vector[3] R2c ;
  for(p in 1:3){
    Vg[p] = variance(log(a[,p]) - log(theta[pop,p])) ;
    Vr[p] = variance(to_vector(log(thetai[,p])) - log(A*a[,p])) ;
  }
  R2m  = Vp ./ (Vp + Vg + Vr) ;
  R2c = (Vp + Vg) ./ (Vp + Vg + Vr) ;
}
