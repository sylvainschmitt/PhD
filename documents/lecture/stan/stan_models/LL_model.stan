data {
  int<lower=1>  N; // Number of observations
  vector<lower=0>[N] logLMA; // Leaf Mass per Area
  vector<lower=0>[N] logLL; // Leaf Lifespan
}
parameters {
  real alpha; // intercept
  real beta; // LMA parameter
  real<lower=0, upper=10> sigma; // variance
}
model {
  alpha ~ gamma(10^-2, 10^-2); // alpha prior
  beta ~ gamma(10^-2, 10^-2); // beta prior
  sigma ~ uniform(0, 10); // sigma prior
  logLL ~ normal(alpha + beta*logLMA, sigma); // Likelihood
} // empty line at the end (C++)
