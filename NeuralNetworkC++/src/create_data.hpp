#ifndef CREATE_DATA_HPP
#define CREATE_DATA_HPP

#include <random>
#include <string>
#include <cmath>
#include <vector>
#include <armadillo>

#include <boost/numeric/ublas/matrix.hpp>
#include <boost/math/constants/constants.hpp>

using namespace arma;

typedef std::vector<mat> matrixes;

matrixes create_data(int numSamples,int numClasses, std::string shape); 

#endif