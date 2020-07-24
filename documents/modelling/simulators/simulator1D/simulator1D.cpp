#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector build_gradient(
    double gradientlim,
    int length
){
  double step = gradientlim*2/(length-1) ;
  NumericVector gradient(length) ;
  gradient[0] = - gradientlim ;
  for (int i = 1; i < length; i++)
    gradient[i] = gradient[i-1] + step ;
  return gradient ;
}

// [[Rcpp::export]]
List simulator1D_cpp(
    int  Nind = 50,
    int Ngen = 50,
    double muG = 0,
    double sigmaG = 1,
    double muE = 0,
    double sigmaE = 1,
    double Elim = 10,
    int seedlings = 4,
    int dispersal = 1,
    bool viability_deterministic = true
) {
  NumericMatrix A(Ngen, Nind) ;
  NumericMatrix Z(Ngen, Nind) ;
  NumericVector E = build_gradient(Elim, Nind) ;
  NumericMatrix Aoffsprings(Nind, seedlings) ;
  NumericMatrix Zoffsprings(Nind, seedlings) ;
  NumericVector Ap(2*dispersal+1) ;
  NumericVector w(seedlings) ;
  IntegerVector seeds(seedlings) ;
  int imin , imax, winner ;
  double muS ;
  A.row(0) = rnorm(Nind, muG, sigmaG) ; 
  Z.row(0) = rnorm(Nind, muE, sigmaE) ;
  for(int s = 0; s < seedlings; s++)
    seeds(s) = s ;
  for (int g = 1; g < Ngen; g++){
    for (int i = 0; i < Nind; i++){
      imin = 0 ;
      imax = Nind ;
      if(i-dispersal > 0){
        imin = i-dispersal ;
      } 
      if(i+dispersal+1 < Nind){
        imax = i+dispersal+1 ;
      }
      NumericVector Ap(imax-imin) ;
      for(int p = 0; p < imax-imin; p++) Ap(p) = A(g-1,imin+p) ;
      for (int s = 0; s < seedlings; s++){
        Aoffsprings(i,s) = rnorm(1, mean(sample(Ap, 2)), sigmaG/2)[0] ;
        Zoffsprings(i,s) = Aoffsprings(i,s) + rnorm(1, muE, sigmaE)[0] ;
      }
      if(viability_deterministic){
        winner = which_min(sqrt(pow(Zoffsprings(i,_)-E(i), 2))) ; 
      } else {
        w = 1/sqrt(pow(Zoffsprings(i,_)-E(i), 2)) ;
        winner = sample(seeds, 1, true, w)[0] ;
      }
      A(g,i) = Aoffsprings(i,winner) ;
      Z(g,i) =  Zoffsprings(i,winner) ;
    }
  }
  List sim = List::create(Named("A") = A, 
                          Named("Z") = Z,
                          Named("E") = E) ;
  return sim;
}
