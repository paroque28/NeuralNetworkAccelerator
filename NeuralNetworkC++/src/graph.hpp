#ifndef GRAPH_HPP
#define GRAPH_HPP

#include <vector>
#include <string>
#include <armadillo>
#include "gnuplot-iostream.hpp"

#include "nn.hpp"

using namespace arma;

void graphDataset( mat X, mat Y);
void graphFunction(mat W1, mat W2);

#endif