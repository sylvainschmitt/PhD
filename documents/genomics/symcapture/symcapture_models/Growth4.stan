data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ;
  vector[I] DBH0 ;
  vector[I] Y0 ;
  vector[I] DBHtoday ;
  int<lower=1, upper=I> ind[I] ; // individual
  int<lower=1, upper=Y> pop[I] ; // gene pools
  vector[3] L;  // lower bounds
  vector[3] U;  // upper bounds
}
parameters {
  matrix<lower=0, upper=1>[P,3] theta_raw ;
  matrix<lower=0, upper=1>[I,3] thetai_raw ;
  vector<lower=0>[3] sigmaR ; // parameters residual variances
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  matrix[P,3] theta ;
  matrix[I, 3] thetai ;
  vector<lower=0>[3] sigmaP ; // population variances
  vector<lower=0>[I] DBH ;
  for(i in 1:3) {
    theta[,i] = L[i] + (U[i] - L[i]) * theta_raw[,i] ;
    thetai[,i] = L[i] + (U[i] - L[i]) * thetai_raw[,i] ;
    sigmaP[i] = variance(theta[pop,i]) ;
  }
  DBH = rep_vector(1, I) ;
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ; 
    }
    DBH += thetai[ind,1] .* exp(-0.5*(log(DBH ./ thetai[ind,2]) ./ thetai[ind,3]) .* (log(DBH ./ thetai[ind,2]) ./ thetai[ind,3])) ;
  }
}
model {
  DBHtoday ~ normal(DBH, sigma) ;
  for(i in 1:3)
    thetai[,i]  ~ normal(theta[pop,i], sqrt(sigmaR[i])) ;
  sigma ~ student_t(4, 0, 1) ;
  for(i in 1:3)
    theta_raw[,i] ~ lognormal(0, 1) ;
}
generated quantities {
  vector[3] R2 ;
  R2 = sigmaP ./ (sigmaP + sigmaR) ;
}
