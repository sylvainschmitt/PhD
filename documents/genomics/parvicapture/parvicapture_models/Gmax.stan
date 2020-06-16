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
  vector<lower=0, upper=1>[P] thetap1 ;
  real<lower=0, upper=1> theta2 ;
  real<lower=0, upper=1> theta3 ;
  vector[I] epsilon1 ;
  vector[P] epsilon2 ;
  vector[P] epsilon3 ;
  vector<lower=0>[4] sigma ;
}
transformed parameters {
  vector<lower=0>[I] DBH = rep_vector(1, I) ;
  real<lower=0> Vp = variance(log(thetap1[pop])) ;
  vector<lower=0>[I] thetai1 = exp(log(thetap1[pop]) + sigma[2]*epsilon1) ; 
  vector<lower=0>[P] thetap2 = exp(log(theta2) + sigma[3]*epsilon2) ; 
  vector<lower=0>[P] thetap3 = exp(log(theta3) + sigma[4]*epsilon3) ; 
  for(t in 1:Y-1) {
    for(i in 1:I) {
      if(years[t] == Y0[i])
        DBH[i] = DBH0[i] ;
    }
    DBH += thetai1 .* exp(-0.5* square(log(DBH ./ (100*thetap2[pop])) ./ thetap3[pop])) ;
  }
  DBH = DBH - DBH0 ;
}
model {
  DBHtoday - DBH0 ~ lognormal(log(DBH), sigma[1]) ;
  epsilon1 ~ std_normal() ;
  epsilon2 ~ std_normal() ;
  epsilon3 ~ std_normal() ;
  thetap1 ~ lognormal(0, 1) ;
  theta2 ~ lognormal(0, 1) ;
  theta3 ~ lognormal(0, 1) ;
  sigma ~ normal(0, 1) ;
}
generated quantities{
  real Vr = square(sigma[2]) ;
  real R2 = Vp / (Vp + Vr) ;
}
