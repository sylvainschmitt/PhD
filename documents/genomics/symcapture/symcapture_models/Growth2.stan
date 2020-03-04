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
  vector<lower=0, upper=5>[P] Gmax ;
  vector<lower=10, upper=200>[P] Dopt ;
  vector<lower=0.1, upper=1.5>[P] Ks ;
  matrix[I, 3] thetai ;
  vector<lower=0>[3] sigmaR ; // parameters residual variances
  real<lower=0, upper=sigmaR[1]> sigma ; // global residual variance
}
transformed parameters {
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  vector<lower=0>[3] sigmaP = [variance(Gmax), variance(Dopt), variance(Ks)]'; // population variance
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += (Gmax[pop] + sqrt(sigmaR[1])*thetai[,1]) .* 
    exp(-0.5*square(log(DBH ./ (Dopt[pop] + sqrt(sigmaR[2])*thetai[,2])) 
    ./ (Ks[pop] + sqrt(sigmaR[3])*thetai[,3]))) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma) ;
  for(p in 1:3) thetai[,p] ~ normal(0, 1) ;
  Gmax ~ lognormal(log(0.5),1) ;
  Dopt ~ lognormal(log(50),1) ;
  Ks ~ lognormal(log(0.5),1) ;
  sigmaR[1] ~ cauchy(0, 1) ;
  sigmaR[2] ~ cauchy(0, 10) ;
  sigmaR[3] ~ cauchy(0, 1) ;
  sigma ~ cauchy(0, 1) ;
}
generated quantities{
  vector<lower=0>[3] R2 ;
  R2 = sigmaP ./ (sigmaP + sigmaR) ;
}
