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
  vector<lower=0.1,upper=5>[G] Gmax ; // potential growth
  vector<lower=0,upper=200>[G] Dopt ; // optimal diameter
  vector<lower=0.1,upper=2>[G] Ks ; // kurtosis
  matrix[G, 4] beta ; // environmental effects
  real<lower=0,upper=3> sigma ; // variance
}
model {
  log(AGR+1) ~ normal(Gmax[gp] .* exp(-0.5*(log(DBH ./ Dopt[gp]) ./ Ks[gp]).*(log(DBH ./ Dopt[gp]) ./ Ks[gp])) .* exp(-beta[gp,1] .* TWI) .* exp(-beta[gp,2] .* AUC) .* exp(-beta[gp,3] .* logNCI) .* exp(-beta[gp,4] .* logANCR), sigma) ; // likelihood
}
