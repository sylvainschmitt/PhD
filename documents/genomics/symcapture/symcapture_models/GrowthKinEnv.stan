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
  vector[I] TWIi ; // individual topographic wetness index
  vector[G] TWIp ; // population topographic wetness index
}
transformed data{
  matrix[I, I] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0>[I] Gmaxi ; // individual maximum growth potential
  vector<lower=0, upper=200>[I] Dopti ; // individual optimal growth diameter
  vector<lower=0.1, upper=10>[I] Ksi ; // individual growth kurtosis

  vector<lower=0.1, upper=10>[G] Gmaxp ; // population maximum growth potential
  vector<lower=0, upper=200>[G] Doptp ; // population optimal growth diameter
  vector<lower=0.1, upper=3>[G] Ksp ; // population growth kurtosis
  
  real<lower=0.1, upper=10> Gmax ; // complex maximum growth potential
  real<lower=0, upper=200> Dopt ; // complex optimal growth diameter
  real<lower=0.1, upper=3> Ks ; // complex growth kurtosis
  
  vector[I]  a[3] ; // breeding values
  vector<lower=0>[3] sigmaP ; // population variances
  vector<lower=0>[3] sigmaG ; // genetic variances
  vector<lower=0>[3] sigmaR ; // residual variances
  real<lower=0,upper=2> sigma ; // final residual variance
  
  vector[3] Topoi ;
}
model {
  log(AGR+1) ~ normal(Gmaxi[ind] .* exp(-0.5*(log(DBH ./ Dopti[ind]) ./ Ksi[ind]).*(log(DBH ./ Dopti[ind]) ./ Ksi[ind])), sigma) ; // likelihood
  
  for(i in 1:3)
    a[i] ~ normal(0, sqrt(sigmaG[i])) ; // individual random effects
  
  Gmaxi ~ normal(Gmaxp[indingp] + Topoi[1]*TWIi + A*a[1], sigmaR[1]) ; // population random effects
  Dopti ~ normal(Doptp[indingp] + Topoi[2]*TWIi + A*a[2], sigmaR[2]) ;
  Ksi ~ normal(Ksp[indingp] + Topoi[3]*TWIi + A*a[3], sigmaR[3]) ;
  
  Gmaxp ~ normal(Gmax, sigmaP[1]) ; // complex random effects
  Doptp ~ normal(Dopt, sigmaP[2]) ;
  Ksp ~ normal(Ks, sigmaP[3]) ;
  
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
