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
  matrix<lower=0, upper=1>[I, 3] thetai_raw ;
  vector<lower=0, upper=1>[3] sigmaR_raw ; // parameters residual variances
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  vector[3] L = [0, 10, 0.1]' ;  // lower bounds
  vector[3] U = [2, 100, 1.5]' ;  // upper bounds
  vector[3] V = [2, 20, 1]' ;  // varainces bounds bounds
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  matrix[P,3] theta ;
  vector<lower=0>[3] sigmaP ; // population variance
  matrix[I,3] thetai ;
  vector[3] sigmaR = V .* sigmaR_raw ;
  for(p in 1:3) {
    theta[,p] = L[p] + (U[p] - L[p]) * theta_raw[,p] ;
    sigmaP[p] = variance(theta[,p]) ;
    thetai[,p] = L[p] + (U[p] - L[p]) * thetai_raw[,p] ;
  }
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += thetai[,1] .* exp(-0.5*square(log(DBH ./ thetai[,2]) ./ thetai[,3])) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma) ;
  for(p in 1:3) {
    thetai[,p] ~ normal(theta[pop,p], sqrt(sigmaR[p])) ;
    theta_raw[,p] ~ lognormal(0,1) ; 
  }
  sigmaR_raw ~ cauchy(0, 1) ;
  sigma ~ cauchy(0, 1) ;
}
generated quantities{
  vector<lower=0>[3] R2 ;
  R2 = sigmaP ./ (sigmaP + sigmaR) ;
}
