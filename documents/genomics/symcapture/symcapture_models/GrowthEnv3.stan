data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  int<lower=1> G ; // # of gene pools
  vector[N] AGR ; // annual growth rate
  vector[N] DBH ; // diameter at breast height
  vector[N] TWI ; // topographic wetness index
  vector[N] AUC ; // aurea under the curve or relative water exttractable
  vector[N] logNCI ; // log of neighbor corwding index
  vector[N] logANCR ; // log of annual neighbor crowding rate
  int<lower=1, upper=I> ind[N] ; // individual
  int<lower=1, upper=G> gp[N] ; // gene pools
  int<lower=1, upper=G> indingp[I] ; // gene pools
}
parameters {
  vector<lower=0.1,upper=10>[G] Gmax ; // gene pool potential growth
  vector<lower=0.1,upper=10>[I] Gmaxi ; // individual potential growth
  vector<lower=0,upper=200>[G] Dopt ; // gene pool optimal diameter
  vector<lower=0,upper=200>[I] Dopti ; // individual optimal diameter
  vector<lower=0.1,upper=3>[G] Ks ; // gene pool kurtosis
  vector<lower=0.1,upper=10>[I] Ksi ; // individual kurtosis
  real beta[4] ; // environmental effects
  real<lower=0,upper=2> sigmaGmax ; // individual potential growth variance
  real<lower=0,upper=50> sigmaDopt ; // individual optimal diameter  variance
  real<lower=0,upper=1> sigmaKs ; // individual kurtosis variance
  real<lower=0,upper=2> sigma ; // residual variance
}
model {
  Gmaxi ~ normal(Gmax[indingp], sigmaGmax) ; // random effects
  Dopti ~ normal(Dopt[indingp], sigmaDopt) ;
  Ksi ~ normal(Ks[indingp], sigmaKs) ;
  log(AGR+1) ~ normal(Gmaxi[ind] .* exp(-0.5*(log(DBH ./ Dopti[ind]) ./ Ksi[ind]).*(log(DBH ./ Dopti[ind]) ./ Ksi[ind])) .* exp(-beta[1]*TWI) .* exp(-beta[2]*AUC) .* exp(-beta[3]*logNCI) .* exp(-beta[4]*logANCR), sigma) ; // likelihood
}
