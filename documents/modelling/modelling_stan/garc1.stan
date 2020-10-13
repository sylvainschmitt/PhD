data{
 int<lower=0> N ; // timesteps
 real r[N] ; // response
 real<lower=0> sigma1 ; // scale of noise a t=1
}
parameters {
 real mu ; //average return
 real<lower=0> alpha0 ; // intercept
 real<lower=0, upper=1> alpha1 ; // slope on location
 real<lower=0, upper=(1-alpha1)> beta1 ; // slope on volatility
}
transformed parameters {
 real<lower=0> sigma[N] ;
 sigma[1] = sigma1 ;
 for(t in 2:N)
  sigma[t] = sqrt(alpha0 + 
                  alpha1*(r[t-1]-mu)*(r[t-1]-mu) +
                  beta1*(sigma[t-1]-mu)*(sigma[t-1]-mu)) ; //error term 
}
model{
  r ~ normal(mu, sigma) ;
}
