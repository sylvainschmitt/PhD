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
  vector<lower=0, upper=5>[I] Gmax ; // maximum growth potential
  vector<lower=0, upper=200>[P] Dopt ; // optimal growth diameter
  vector<lower=0, upper=2>[P] Ks ; // growth kurtosis
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  vector<lower=0>[I] DBH ;
  DBH = rep_vector(1, I) ; // not 0 because of log after anyway DBH is forgotten as soon as the tree is recruited
  for(t in 1:Y-1) {
    DBH += exp(-0.5*(log(DBH ./ Dopt[pop]) ./ Ks[pop]) .* (log(DBH ./ Dopt[pop]) ./ Ks[pop])) ;
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = exp(-0.5*(log(DBH0[i] / Dopt[pop[i]]) / Ks[pop[i]]) * (log(DBH0[i] / Dopt[pop[i]]) / Ks[pop[i]])) ;
    } 
  }
}
model {
  Gmax ~ lognormal(log((DBHtoday - DBH0) ./ DBH), sqrt(sigma)) ;
  Dopt ~ lognormal(0, 100) ;
  Ks ~ lognormal(0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
