#include <iostream>
#include <string>
#include <vector>

#include <boost/program_options/options_description.hpp>
#include <boost/program_options/variables_map.hpp>
#include <boost/program_options/parsers.hpp>
#include <boost/numeric/ublas/io.hpp>
#include "gnuplot-iostream.hpp"

#include "weight_generator.hpp"
#include "create_data.hpp"

namespace po = boost::program_options;
const std::string version = "0.1.0";


int
main(int argc, char* argv[])
{
	int numberOfClasses  = 3;
	int numberOfNeurons  = 64;
	float lambda = 1.0 ; 
	float threshold = 0.00001;
	int total = 10;
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

	matrixes data;
	matrix X, Y;
	data = create_data(total, numberOfClasses, style);
	X = data[0];
	Y = data[1];
	std::cout << "X: " <<X << std::endl;
	std::cout << "Y: " <<Y << std::endl;

	std::vector<std::vector<std::pair<double, double> >> graphClasses;
	for (int classi = 0; classi < numberOfClasses ; classi++){
		std::vector<std::pair<double, double>> graphClass;
		for (int i = 0; i < total ; i++){
			if(Y(i,classi) > 0){
				graphClass.push_back(std::make_pair(X(i,0), X(i,1)));
			}
		}
		graphClasses.push_back(graphClass);
	}

	Gnuplot gp;
	Gnuplot gp(stdout);
	gp << "set term png\n";
	gp << "set output test.png\n";
	gp << "plot '-' with points pointtype 5 title 'pts_A'\n";
	
	gp.send2d(graphClasses.front());

    matrix W1, W2;
    W1 = weight_generator(3,3);
    std::cout << "W1: " <<W1 << std::endl;

	return 0;
}