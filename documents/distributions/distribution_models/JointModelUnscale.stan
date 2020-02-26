functions {
  real dirichlet_multinomial_lpmf(int[] y, vector alpha) {
    real alpha_plus = sum(alpha);
    return lgamma(alpha_plus) + sum(lgamma(alpha + to_vector(y)))
                - lgamma(alpha_plus+sum(y)) - sum(lgamma(alpha));
  }
  real scale(vector x) {
    return sqrt(sum(x .* x)/(num_elements(x) - 1)) ;
  }
}
data {
  int<lower = 1> N  ;       // # of individuals
  int<lower = 1> S  ;       // # of species
  int<lower = 1> K  ;       // # of environmental descriptors
  int<lower = 0, upper=1> Y[N, S]  ; // individuals presence or absence for each species
  matrix[N,K] X ;           // environmental descriptors
  int<lower=0> N_pred ;
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
  vector[S] alpha ; // intercept
  matrix[S,K] beta ; // sigmoidal slope
  matrix[S,K] gamma ; // quadratic form
}
model {
  alpha ~ normal(0,1) ;  
  for(k in 1:K){
    beta[,k] ~ normal(0,1) ;
    gamma[,k] ~ normal(0,1) ;
  }
  for (n in 1:N)
    Y[n] ~ dirichlet_multinomial(softmax(alpha + beta*to_vector(X_std[n,]) + gamma*to_vector(X_std[n,] .* X_std[n,])))  ; // likelihood
}
generated quantities {
  matrix[N_pred,S] Y_pred ; 
  for(n in 1:N_pred)
    Y_pred[n,] = to_row_vector(softmax(alpha + beta*to_vector(X_pred_std[n,]) + gamma*to_vector(X_pred_std[n,] .* X_pred_std[n,]))) ;
}
