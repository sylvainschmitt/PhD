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
  vector<lower=0.1,upper=10>[G] Gmax ; // gene pool maximum growth potential
  vector<lower=0.1,upper=10>[I] Gmaxi ; // individual maximum growth potential
  vector<lower=0,upper=200>[G] Dopt ; // gene pool optimal growth diameter
  vector<lower=0,upper=200>[I] Dopti ; // individual optimal growth diameter
  vector<lower=0.1,upper=3>[G] Ks ; // gene pool growth kurtosis
  vector<lower=0.1,upper=10>[I] Ksi ; // individual growth kurtosis
  vector[I]  a[3] ; // breeding values
  vector<lower=0>[3] sigmaG ; // genetic variances
  vector<lower=0>[3] sigmaR ; // residual variances
  real<lower=0,upper=2> sigma ; // final residual variance
}
transformed parameters {
  vector<lower=0>[3] sigmaP ; // population variances
  sigmaP[1] = variance(Gmax[indingp]) ;
  sigmaP[2] = variance(Dopt[indingp]) ;
  sigmaP[3] = variance(Ks[indingp]) ;
}
model {
  log(AGR+1) ~ normal(Gmaxi[ind] .* exp(-0.5*(log(DBH ./ Dopti[ind]) ./ Ksi[ind]).*(log(DBH ./ Dopti[ind]) ./ Ksi[ind])), sigma) ; // likelihood
  
  for(i in 1:3)
    a[i] ~ normal(0, sqrt(sigmaG[i])) ; // individual random effects
  
  Gmaxi ~ normal(Gmax[indingp] + A*a[1], sigmaR[1]) ; // population random effects
  Dopti ~ normal(Dopt[indingp] + A*a[2], sigmaR[2]) ;
  Ksi ~ normal(Ks[indingp] + A*a[3], sigmaR[3]) ;
  
  sigmaR ~ lognormal(0, 1) ;
  sigmaG ~ lognormal(0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
generated quantities{
  vector[3] R2m ;
  vector[3] R2c ;
  R2m = sigmaP ./ (sigmaP + sigmaG + sigmaR) ;
  R2c = (sigmaP + sigmaG) ./ (sigmaP + sigmaG + sigmaR) ;
}
