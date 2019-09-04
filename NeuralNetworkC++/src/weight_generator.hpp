#ifndef WEIGHT_HPP
#define WEIGHT_HPP

#include <random>
#include <boost/numeric/ublas/matrix.hpp>

typedef boost::numeric::ublas::matrix<double> matrix;

matrix weight_generator(int number_neurons, int number_inputs); 

#endif