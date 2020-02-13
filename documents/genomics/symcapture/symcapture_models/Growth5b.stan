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
  vector<lower=0, upper=5>[P] Gmax ; // maximum growth potential
  vector<lower=0, upper=200>[P] Dopt ; // optimal growth diameter
  vector<lower=0, upper=2>[P] Ks ; // growth kurtosis
  vector<lower=0, upper=5>[I] Gmaxi ; // maximum growth potential
  real<lower=0> sigmaR ; // parameters residual variances
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  vector<lower=0>[I] DBH ;
  DBH = rep_vector(1, I) ; // not 0 because of log after anyway DBH is forgotten as soon as the tree is recruited
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += Gmaxi .* exp(-0.5*(log(DBH ./ Dopt[pop]) ./ Ks[pop]) .* (log(DBH ./ Dopt[pop]) ./ Ks[pop])) ;
  }
}
model {
  DBHtoday ~ lognormal(log(DBH), sigma) ;
  Gmaxi  ~ lognormal(log(Gmax[pop]), sqrt(sigmaR)) ;
  Gmax ~ lognormal(log(0.5), 1) ;
  Dopt ~ lognormal(log(30), 10) ;
  Ks ~ lognormal(log(0.5), 1) ;
  sigmaR ~ student_t(4, 0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
