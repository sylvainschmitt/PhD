functions {
  real scale(vector x) {
    return sqrt(sum(x .* x)/(num_elements(x) - 1)) ;
  }
}
data {
  int<lower=1> N ;                // # of individuals
  int<lower=1> K ;                // # of environmental descriptors
  int<lower=0, upper=1> Y[N] ;    // individuals presence or absence (0-1) 
  matrix[N,K] X ;                 // environmental descriptors
  int<lower=1> N_pred ;
  matrix[N_pred,K] X_pred ;            
}
transformed data {
  matrix[N,K] X_std ;
  matrix[N_pred,K] X_pred_std ; 
  for(k in 1:K) {
    X_std[,k] = X[,k] / scale(X[,k]) ;  
    X_pred_std[,k] = X_pred[,k] / scale(X[,k]) ;  
  }
}
parameters {
  real alpha ;       // intercept
  vector[K] beta ;   // sigmoidal slope
  vector[K] gamma ;  // quadratic form
}
model {
  alpha ~ normal(0, 1) ;
  beta ~ normal(0, 1) ;
  gamma ~ normal(0, 1) ;
  Y ~ bernoulli_logit(alpha + X_std * beta + (X_std .* X_std) * gamma) ;
}
generated quantities {
  vector[N_pred] Y_pred ; 
  Y_pred = inv_logit(alpha + X_pred_std * beta + (X_pred_std .* X_pred_std) * gamma) ;
}
