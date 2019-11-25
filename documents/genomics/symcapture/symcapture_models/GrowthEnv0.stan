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
}
parameters {
  real<lower=0.1,upper=10> Gmax ; // potential growth
  real<lower=0,upper=200> Dopt ; // optimal diameter
  real<lower=0.1,upper=10> Ks ; // kurtosis
  real beta[4] ; // environmental effects
  real<lower=0,upper=10> sigma ; // variance
}
model {
  log(AGR+1) ~ normal(Gmax*exp(-0.5*(log(DBH/Dopt)/Ks).*(log(DBH/Dopt)/Ks)) .* exp(-beta[1]*TWI) .* exp(-beta[2]*AUC) .* exp(-beta[3]*logNCI) .* exp(-beta[4]*logANCR), sigma) ; // likelihood
}
