#ifndef NN_HPP
#define NN_HPP

#include <vector>
#include <armadillo>
using namespace arma;

std::vector<mat> train(mat W1,mat W2,mat X,mat Y, float lambda,int batchSize, float threshold);
mat predict(mat W1, mat W2, mat X);

#endif