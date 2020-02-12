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
}
parameters {
  vector<lower=0, upper=5>[P] Gmax ; // maximum growth potential
  vector<lower=0, upper=200>[P] Dopt ; // optimal growth diameter
  vector<lower=0, upper=2>[P] Ks ; // growth kurtosis
  vector<lower=0, upper=5>[I] Gmaxi ; // maximum growth potential
  vector<lower=0, upper=200>[I] Dopti ; // optimal growth diameter
  vector<lower=0, upper=2>[I] Ksi ; // growth kurtosis
  vector<lower=0>[3] sigmaR ; // parameters residual variances
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  vector[I] DBH ;
  DBH = rep_vector(1, I) ; // not 0 because of log after anyway DBH is forgotten as soon as the tree is recruited
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += Gmaxi[ind] .* exp(-0.5*(log(DBH ./ Dopti[ind]) ./ Ksi[ind]) .* (log(DBH ./ Dopti[ind]) ./ Ksi[ind])) ;
  }
}
model {
  DBHtoday ~ normal(DBH, sigma) ;
  Gmaxi  ~ normal(Gmax[pop], sqrt(sigmaR[1])) ;
  Ksi  ~ normal(Ks[pop], sqrt(sigmaR[2])) ;
  Dopti  ~ normal(Dopt[pop], sqrt(sigmaR[3])) ;
  sigma ~ student_t(4, 0, 1) ;
  Gmax ~ lognormal(0, 1) ;
  Dopt ~ lognormal(0, 10) ;
  Ks ~ lognormal(0, 1) ;
}
