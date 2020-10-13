data{
 int<lower=0> N ; // timesteps
 real r[N] ; // response
}
parameters {
 real mu ; //average return
 real<lower=0> alpha0 ; // noise intercept
 real<lower=0, upper=1> alpha1 ; // noise slope
}
model{
 for(t in 2:N){
  r[t] ~ normal(mu, sqrt(alpha0 + alpha1*(r[t-1]-mu)*(r[t-1]-mu))) ;
 }
}
