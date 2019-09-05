#include <iostream>
#include <string>
#include <vector>
#include <armadillo>

#include <boost/program_options/options_description.hpp>
#include <boost/program_options/variables_map.hpp>
#include <boost/program_options/parsers.hpp>
#include <boost/numeric/ublas/io.hpp>

#include "create_data.hpp"
#include "train.hpp"
#include "graph.hpp"

namespace po = boost::program_options;
const std::string version = "0.1.0";


int main(int argc, char* argv[])
{
	int numberOfClasses  = 3;
	int numberOfNeurons  = 64;
	float lambda = 1.0 ; 
	float threshold = 0.00001;
	int total = 5;
	float batchProportion = 0.7;
	std::string style = "radial";

	po::options_description desc("Options");
	desc.add_options()
		("help", "Show this help message.")
		("version", "Show this program version.")
		("numberOfClasses,c", po::value<int>(),
			"Number of Classes generated.")
		("numberOfNeurons,n", po::value<int>(),
			"Number of Neurons for training.")
		("lambda,l", po::value<float>(),
			"Lambda for steps.")
		("threshold,t", po::value<float>(),
			"Thredshold for stop condition.")
		("batchSize,b", po::value<float>(),
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


	return 0;
}