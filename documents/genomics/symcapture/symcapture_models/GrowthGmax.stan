data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ;
  vector[I] DBH0 ;
  vector[I] Y0 ;
  vector[I] DBHtoday ;
  int<lower=1, upper=Y> pop[I] ; // gene pools
}
parameters {
  matrix<lower=0, upper=1>[P,3] theta_raw ;
  vector<lower=0, upper=5>[I] Gmaxi ;
  real<lower=0> sigmaR ;
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  vector[3] U = [5, 200, 3]' ;  // upper bounds
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  matrix[P,3] theta ;
  real<lower=0> sigmaP = variance(theta[,1]) ;
  for(p in 1:3) {
    theta[,p] = U[p]*theta_raw[,p] ;
  }
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += Gmaxi .* exp(-0.5* square(log(DBH ./ theta[pop,2]) ./ theta[pop,3])) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sqrt(sigma)) ;
  Gmaxi ~ lognormal(log(theta[pop,1]), sqrt(sigmaR)) ;
  for(p in 1:3)
    theta_raw[,p] ~ lognormal(0,1) ; 
  sigmaR ~ cauchy(0, 1) ;
  sigma ~ cauchy(0, 1) ;
}
