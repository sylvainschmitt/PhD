data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  int<lower=1> G ; // # of gene pools
  vector[N] AGR ; // annual growth rate
  vector[N] DBH ; // diameter at breast height
  vector[N] AREW ; // area under the curve or relative water extractable
  vector[N] NCI ; // neighbor crowding index
  int<lower=1, upper=I> ind[N] ; // individual
  int<lower=1, upper=G> gp[N] ; // gene pools
  int<lower=1, upper=G> indingp[I] ; // gene pools
}
parameters {
  real<lower=0.1,upper=3> Gmax ; // maximum growth potential
  real<lower=0,upper=200> Dopt ; // optimal growth diameter
  real<lower=0.1,upper=3> Ks ; // growth kurtosis
  real Clim ; // AREW slope
  real Comp ; // NCI slope
  
  vector<lower=0.1,upper=3>[G] Gmaxg ; // gene pool maximum growth potential
  vector<lower=0,upper=200>[G] Doptg ; // gene pool optimal growth diameter
  vector<lower=0.1,upper=3>[G] Ksg ; // gene pool growth kurtosis
  
  vector<lower=0.1,upper=3>[I] Gmaxi ; // individual maximum growth potential
  vector<lower=0,upper=200>[I] Dopti ; // individual optimal growth diameter
  vector<lower=0.1,upper=10>[I] Ksi ; // individual growth kurtosis
  
  real<lower=0,upper=2> sigmaGmaxg ; // gene pool maximum growth potential variance
  real<lower=0,upper=50> sigmaDoptg ; // gene poo optimal growth diameter variance
  real<lower=0,upper=2> sigmaKsg ; // gene poo growth kurtosis variance
  
  real<lower=0,upper=2> sigmaGmaxi ; // individual maximum growth potential variance
  real<lower=0,upper=50> sigmaDopti ; // individual optimal growth diameter variance
  real<lower=0,upper=2> sigmaKsi ; // individual growth kurtosis variance
  
  real<lower=0,upper=2> sigma ; // residual variance
}
model {
  log(AGR+1) ~ normal(Gmaxi[ind] .* exp(-0.5*(log(DBH ./ Dopti[ind]) ./ Ksi[ind]).*(log(DBH ./ Dopti[ind]) ./ Ksi[ind])) + Clim*AREW + Comp*NCI, sigma) ; // likelihood
  
  Gmaxi ~ normal(Gmaxg[indingp], sigmaGmaxi) ; // individual random effects
  Dopti ~ normal(Doptg[indingp], sigmaDopti) ;
  Ksi ~ normal(Ksg[indingp], sigmaKsi) ;
  
  Gmaxg ~ normal(Gmax, sigmaGmaxg) ;  // gene pool random effects
  Doptg ~ normal(Dopt, sigmaDoptg) ;
  Ksg ~ normal(Ks, sigmaKsg) ;
}
