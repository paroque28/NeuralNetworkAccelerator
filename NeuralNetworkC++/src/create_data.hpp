#ifndef CREATE_DATA_HPP
#define CREATE_DATA_HPP

#include <random>
#include <string>
#include <cmath>
#include <vector>

#include <boost/numeric/ublas/matrix.hpp>
#include <boost/math/constants/constants.hpp>

typedef boost::numeric::ublas::matrix<double> matrix;
typedef boost::numeric::ublas::vector<double> vector;
typedef std::vector<matrix> matrixes;

matrixes create_data(int numSamples,int numClasses, std::string shape); 

#endif