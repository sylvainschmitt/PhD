functions{
  real log_F(
    int recruitment, // recruitment
    int y, // year
    int[] years, // censuses dates
    row_vector beta, // parameters
    vector[] x
  ){
    real ret ;
    real ret2 ;
    ret=0 ;
    for (j in years[recruitment]:(years[y-1]-1))
      ret-=exp(beta*x[j]) ;
    ret2=0 ;
    for (j in years[y-1]:(years[y]-1))
      ret2-=exp(beta*x[j]) ; 
    ret+=log_diff_exp(0, ret2) ;
    return ret ;
  }
  real cox_ll(
    int recruitment, // recruitment
    int death, // death
    int[] years, // census dates
    row_vector beta, // parameters
    vector[] x, // covariables per year
    int dead // censored index
  ){
    if(dead!=0){
      return log_F(recruitment, death, years, beta, x);
    }
    else{
    real likelihood ;
    likelihood = 1 ;
    for (y in (recruitment+1):death)
      likelihood -= exp(log_F(recruitment, y, years, beta, x)) ;
    return log(likelihood) ;
    }
  }
}

data {
  int<lower=1> Y ; // # of years
  int<lower=1> I ; // # of individuals
  int<lower=0> K ; // # number of covariables
  int<lower=1> L ; // total # of years
  int years[Y] ; // years
  vector[K] X[I,L] ; // covariables per individual and year, i.e. X[i,j, c] covariable c for individual i at census j
  int recruitment[I] ; // year of recruitment
  int death[I] ; // year of death or last census
  int dead[I] ; // dead during censuses
}
parameters{
  row_vector[K+1] beta ; // paramèters w beta[1] as intercept
}
model{
  for (i in 1:I)
    target+= cox_ll(recruitment[i], death[i], years, beta, X[i], dead[i]) ;
}
