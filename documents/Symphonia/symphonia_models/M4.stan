data {
  int<lower=0> I ; // Nb of trees
  vector<lower=0>[I] growth ; // growth vector
  vector<lower=0>[I] dbh ; // dbh in 1988 vector
  int<lower=0> J ; // Nb of gaps
  vector<lower=0>[J] S ; // gaps surface vector
  matrix<lower=0>[I,J] D ; // tree-gaps distance matrix
}
parameters {
  real mu ; // disturbance index base parameter
  real alpha ; // distance parameter
  real<lower=0,upper=3> beta ; // surface parameter (power)
  real omega ; // base growth parameter
  real<lower=0,upper=10> sigma ;
}
transformed parameters {
  vector[J] Sbeta ; // Sbeta is S^beta because pow(vector,real) is impossible in stan
  vector[I] Idisturb ; // disturbance index
  for(j in 1:J)
    Sbeta[j] = pow(S[j], beta) ;
  for(i in 1:I)
    Idisturb[i] = exp(-alpha*D[i,])*Sbeta ;
}
model {
  growth ~ normal(mu*Idisturb+omega, sigma) ;
}

// model {
//   growth ~ normal(mu*exp(-alpha*D)*Sbeta, sigma) ; 
// }
// beware exessive use of vectorial and matricial computation:
// for a given i
// Idisturb[i] = exp(-alpha*D[i,])*Sbeta
// because D[i,] is a row vector (row from a matrix)
// and Sbeta is a vector (default column)
// so exp(-alpha*D[i,])*Sbeta = sum_j(exp(-alpha*D[i,j])*Sbeta[j])
