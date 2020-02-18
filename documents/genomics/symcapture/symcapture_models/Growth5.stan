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
  vector<lower=1, upper=200>[P] Dopt ; // optimal growth diameter
  vector<lower=0, upper=2>[P] Ks ; // growth kurtosis
  vector<lower=0, upper=5>[I] Gmaxi ; // maximum growth potential
  vector<lower=1, upper=200>[I] Dopti ; // optimal growth diameter
  vector<lower=0, upper=2>[I] Ksi ; // growth kurtosis
  vector<lower=0>[3] sigmaR ; // parameters residual variances
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
    DBH += Gmaxi .* exp(-0.5*(log(DBH ./ Dopti) ./ Ksi) .* (log(DBH ./ Dopti) ./ Ksi)) ;
  }
}
model {
  DBHtoday ~ lognormal(log(DBH), sigma) ;
  for(i in 1:I){
    Gmaxi[i]  ~ normal(Gmax[pop[i]], sqrt(sigmaR[1])) T[0,] ;
    Dopti[i]  ~ normal(Dopt[pop[i]], sqrt(sigmaR[2])) T[1,] ;
    Ksi[i]  ~ normal(Ks[pop[i]], sqrt(sigmaR[3])) T[0,] ;
  }
  Gmax ~ lognormal(log(0.5), 1) ;
  Dopt ~ lognormal(log(30), 10) ;
  Ks ~ lognormal(log(0.5), 1) ;
  sigmaR[1] ~ student_t(4, 0, 1) ;
  sigmaR[2] ~ student_t(4, 0, 10) ;
  sigmaR[3] ~ student_t(4, 0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
