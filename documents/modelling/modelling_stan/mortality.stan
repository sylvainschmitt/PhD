data {
  int<lower=0> N;
  int<lower=0> Y;
  int<lower=0, upper=1> death[N];
  int<lower=1, upper=Y> year[N];
  vector[N] DBH ;
  vector[N] NCI ;
  vector[N] deltaNCI ;
}
parameters {
  vector[Y] theta0y ;
  real theta0 ;
  real<lower=0> sigma_year ;
  real thetaDBH ;
  real thetaNCI ;
  real thetaDeltaNCI ;
}
model {
  death ~ bernoulli_logit(theta0y[year] + thetaDBH*DBH + thetaNCI*NCI + thetaDeltaNCI*deltaNCI) ;
  theta0y ~ normal(theta0, sigma_year) ;
}

