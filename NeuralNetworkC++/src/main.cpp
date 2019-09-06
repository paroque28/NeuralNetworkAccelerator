#include <iostream>
#include <string>
#include <vector>
#include <armadillo>

#include <boost/program_options/options_description.hpp>
#include <boost/program_options/variables_map.hpp>
#include <boost/program_options/parsers.hpp>
#include <boost/numeric/ublas/io.hpp>

#include "create_data.hpp"
#include "nn.hpp"
#include "graph.hpp"

namespace po = boost::program_options;
const std::string version = "0.1.0";


int main(int argc, char* argv[])
{
	int numberOfClasses  = 3;
	int numberOfNeurons  = 64;
	double lambda = 1.0 ; 
	double threshold = 0.0000001;
	int total = 1000;
	double batchProportion = 0.7;
	std::string style = "radial";

	po::options_description desc("Options");
	desc.add_options()
		("help", "Show this help message.")
		("version", "Show this program version.")
		("numberOfClasses,c", po::value<int>(),
			"Number of Classes generated.")
		("numberOfNeurons,n", po::value<int>(),
			"Number of Neurons for training.")
		("lambda,l", po::value<double>(),
			"Lambda for steps.")
		("threshold,t", po::value<double>(),
			"Thredshold for stop condition.")
		("batchSize,b", po::value<double>(),
			"Batch size of training process.")
		("style,s", po::value<std::string>(),
			"Style of dataset generated.")
		("totalSize,g", po::value<int>(),
			"Number number of generated datapoints.")
		("accelerator,a", po::bool_switch()->default_value(false),
    		"Enable Accelerator")
	;

	po::variables_map options;
	po::store(po::parse_command_line(argc, argv, desc), options);
	po::notify(options);

	if (options.count("help") > 0 ) {
		std::cout << desc << '\n';
	}

	if (options.count("version") > 0) {
		std::cout << "Neural network version " << version << '\n';
	}

	if (options.count("numberOfClasses") > 0) numberOfClasses = options["numberOfClasses"].as<int>();
	if (options.count("numberOfNeurons") > 0) numberOfNeurons = options["numberOfNeurons"].as<int>();
	if (options.count("totalSize") > 0) total = options["totalSize"].as<int>();
	if (options.count("threshold") > 0) threshold = options["threshold"].as<double>();
	if (options.count("batchSize") > 0) batchProportion = options["batchSize"].as<double>();
	if (options.count("lambda") > 0) lambda = options["lambda"].as<double>();

	std::cout.precision(17);
	std::cout << "Number of classes: " << numberOfClasses << '\n';
	std::cout << "Number of neurons: " << numberOfNeurons << '\n';
	

	//Start Logic
	// Initialize the random generator
	arma::arma_rng::set_seed_random();

	matrixes data;
	data = create_data(total, numberOfClasses, style);
	arma::mat X = data[0];
	arma::mat Y = data[1];

	graphDataset(X,Y);

	arma::mat W1 = arma::randu(numberOfNeurons, X.n_cols + 1);
	arma::mat W2 = arma::randu(Y.n_cols,W1.n_rows + 1);

	matrixes weight = train(W1,W2,X,Y,lambda,batchProportion*total,threshold);

	W1 = weight[0]; W2 = weight[1];

	graphFunction(W1,W2);

	return 0;
}