#ifndef TRAIN_HPP
#define TRAIN_HPP

#include <vector>
#include <armadillo>
using namespace arma;

std::vector<mat> train(mat W1,mat W2,mat X,mat Y, float lambda,int batchSize, float threshold);


#endif