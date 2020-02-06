data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  int<lower=1> G ; // # of gene pools
  vector[N] AGR ; // annual growth rate
  vector[N] DBH ; // diameter at breast height
  vector[N] TWI ; // topographic wetness index
  vector[N] AREW ; // area under the curve or relative water extractable
  vector[N] NCI ; // neighbor crowding index
  int<lower=1, upper=I> ind[N] ; // individual
  int<lower=1, upper=G> gp[N] ; // gene pools
  int<lower=1, upper=G> indingp[I] ; // individuals in gene pools
}
parameters {
  vector<lower=0.1,upper=10>[G] Gmax ; // gene pool maximum growth potential
  vector<lower=0.1,upper=10>[I] Gmaxi ; // individual maximum growth potential
  vector<lower=0,upper=200>[G] Dopt ; // gene pool optimal growth diameter
  vector<lower=0,upper=200>[I] Dopti ; // individual optimal growth diameter
  vector<lower=0.1,upper=3>[G] Ks ; // gene pool growth kurtosis
  vector<lower=0.1,upper=3>[I] Ksi ; // individual growth kurtosis
  vector<lower=0>[3] sigmaR ; // parameters residual variances
  real<lower=0,upper=2> sigma ; // variances
}
transformed parameters {
  vector<lower=0>[3] sigmaP ; // population variances
  sigmaP[1] = variance(Gmax[indingp]) ;
  sigmaP[2] = variance(Dopt[indingp]) ;
  sigmaP[3] = variance(Ks[indingp]) ;
}
model {
  Gmaxi ~ normal(Gmax[indingp], sqrt(sigmaR[1])) ; // population fied effects
  Dopti ~ normal(Dopt[indingp], sqrt(sigmaR[2])) ;
  Ksi ~ normal(Ks[indingp], sqrt(sigmaR[3])) ;
  log(AGR+1) ~ normal(Gmaxi[ind] .* exp(-0.5*(log(DBH ./ Dopti[ind]) ./ Ksi[ind]).*(log(DBH ./ Dopti[ind]) ./ Ksi[ind])), sigma) ; // likelihood
  
  sigma ~ student_t(4, 0, 1) ;
}
generated quantities {
  vector[3] R2 ;
  R2 = sigmaP ./ (sigmaP + sigmaR) ;
}
