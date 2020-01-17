data {
  int<lower=1> N ; // # of observations: individuals x CensusYear
  int<lower=1> I ; // # of individuals
  int<lower=1> G ; // # of gene pools
  vector[N] AGR ; // annual growth rate
  vector[N] DBH ; // diameter at breast height
  int<lower=1, upper=I> ind[N] ; // individual
  int<lower=1, upper=G> gp[N] ; // gene pools
  int<lower=1, upper=G> indingp[I] ; // individuals in gene pools
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0>[I] thetai[3] ; // individual parameters
  vector<lower=0>[G] thetap[3] ; // population parameters
  vector<lower=0>[3] theta ; // complex parameters
  vector[I]  a[3] ; // breeding values
  vector<lower=0>[3] sigmaP ; // population variances
  vector<lower=0>[3] sigmaG ; // genetic variances
  vector<lower=0>[3] sigmaR ; // residual variances
  real<lower=0,upper=2> sigma ; // final residual variance
}
model {
  log(AGR+1) ~ normal(thetai[1][ind] .* exp(-0.5*(log(DBH ./ thetai[2][ind]) ./ thetai[3][ind]).*(log(DBH ./ thetai[2][ind]) ./ thetai[3][ind])), sigma) ; // likelihood
  for(i in 1:3){
    a[i] ~ normal(0, sqrt(sigmaG[i])) ; // individual random effects
    thetai[i] ~ normal(thetap[i][indingp] + A*a[i], sigmaR[i]) ; // population random effects
    thetap[i] ~ normal(theta[i], sigmaP[i]) ; // complex random effects
  }
  sigmaG ~ lognormal(0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
generated quantities{
  vector<lower=0>[3] h2 ; // strict heritabilities
  vector<lower=0>[3] h2p ; // broad heritabilities
  vector<lower=0>[3] Qst ; // quantitative genetic differentiations
  h2 = sigmaG ./ (sigmaP + sigmaG + sigmaR) ;
  h2p = (sigmaG + sigmaP) ./ (sigmaP + sigmaG + sigmaR) ;
  Qst = sigmaP ./ (sigmaP + 2*sigmaG) ;
}
