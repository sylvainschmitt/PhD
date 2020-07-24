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

/**** R
build_gradient(10, 50)
*/