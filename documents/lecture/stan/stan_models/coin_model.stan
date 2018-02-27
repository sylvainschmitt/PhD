data {
  int<lower=1>  N; // Number of observations
  int<lower=0, upper=1> y[N]; // Observations
}
parameters {
  real<lower=0, upper=1> theta; // Parameter
}
model {
  theta ~ uniform(0, 1); // theta prior
  y ~ bernoulli(theta); // Likelihood
} // empty line at the end (C++)
