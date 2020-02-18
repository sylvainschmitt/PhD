data {
  int<lower=1> I ; // # of individuals
  int<lower=1> Y ; // # of census years
  int<lower=1> P ; // # of populations
  vector[Y] years ;
  vector[I] DBH0 ;
  vector[I] Y0 ;
  vector[I] DBHtoday ;
  int<lower=1, upper=Y> pop[I] ; // gene pools
  cov_matrix[I] K ; // kinship covariance matrix
}
transformed data{
  matrix[I, I] A ; // cholesky-decomposed kinship
  A = cholesky_decompose(K) ;
}
parameters {
  vector<lower=0, upper=5>[P] Gmax ; // maximum growth potential
  vector<lower=1, upper=200>[P] Dopt ; // optimal growth diameter
  vector<lower=0, upper=2>[P] Ks ; // growth kurtosis
  vector<lower=0, upper=5>[I] Gmaxi ; // maximum growth potential
  vector<lower=1, upper=200>[I] Dopti ; // optimal growth diameter
  vector<lower=0, upper=2>[I] Ksi ; // growth kurtosis
  vector<lower=0, upper=1>[I] aG_raw ; // maximum growth potential
  vector<lower=0, upper=1>[I] aD_raw ; // optimal growth diameter
  vector<lower=0, upper=1>[I] aK_raw ; // growth kurtosis
  vector<lower=0>[3] sigmaR ; // parameters residual variances
  vector<lower=0>[3] sigmaG ; // parameters residual variances
  real<lower=0> sigma ; // global residual variance
}
transformed parameters {
  vector<lower=0>[I] DBH ;
  vector[I] aG ;
  vector[I] aD ;
  vector[I] aK ;
  DBH = rep_vector(1, I) ; // not 0 because of log after anyway DBH is forgotten as soon as the tree is recruited
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += Gmaxi .* exp(-0.5*(log(DBH ./ Dopti) ./ Ksi) .* (log(DBH ./ Dopti) ./ Ksi)) ;
  }
  aG = -Gmax[pop] + (5 + Gmax[pop]) .* aG_raw ;
  aD = -Dopt[pop] + (200 + Dopt[pop]) .* aD_raw ;
  aK = -Ks[pop] + (2 + Ks[pop]) .* aK_raw ;
}
model {
  DBHtoday ~ lognormal(log(DBH), sigma) ;
  for(i in 1:I){
    Gmaxi[i]  ~ normal(Gmax[pop[i]] + (A*aG)[i], sqrt(sigmaR[1])) T[0,] ;
    Dopti[i]  ~ normal(Dopt[pop[i]] + (A*aD)[i], sqrt(sigmaR[2])) T[1,] ;
    Ksi[i]  ~ normal(Ks[pop[i]] + (A*aK)[i], sqrt(sigmaR[3])) T[0,] ;
    aG[i] ~ normal(0, sqrt(sigmaG[1])) ;
    aD[i] ~ normal(0, sqrt(sigmaG[2])) ;
    aK[i] ~ normal(0, sqrt(sigmaG[3])) ;
  }
  Gmax ~ lognormal(log(0.5), 1) ;
  Dopt ~ lognormal(log(30), 10) ;
  Ks ~ lognormal(log(0.5), 1) ;
  sigmaR[1] ~ student_t(4, 0, 1) ;
  sigmaR[2] ~ student_t(4, 0, 10) ;
  sigmaR[3] ~ student_t(4, 0, 1) ;
  sigmaG[1] ~ student_t(4, 0, 1) ;
  sigmaG[2] ~ student_t(4, 0, 10) ;
  sigmaG[3] ~ student_t(4, 0, 1) ;
  sigma ~ student_t(4, 0, 1) ;
}
