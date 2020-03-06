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
  matrix<lower=0.01, upper=2>[P,3] theta ;
  real<lower=0> sigmaR ;
}
transformed parameters {
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  real<lower=0> sigmaP = variance(theta[,1]) ;
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += exp(-0.5* square(log(DBH ./ (100*theta[pop,2]))
      ./ theta[pop,3])) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  (DBHtoday - DBH0) ./ DBH ~ lognormal(log(theta[pop,1]), sigmaR) ;
  for(p in 1:3) theta[,p] ~ lognormal(0, 1) ;
  sigmaR ~ lognormal(0, 1) ;
}
