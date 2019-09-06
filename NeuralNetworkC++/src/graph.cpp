#include "graph.hpp" 

void graphDataset(mat X, mat Y){
    Gnuplot gp;
	gp << "set term png\n";

    int total = X.n_rows;
    int numClasses = Y.n_cols;
    std::vector<std::vector<std::pair<double, double> >> graphClasses;
	for (int classi = 0; classi < numClasses ; classi++){
		std::vector<std::pair<double, double>> graphClass;
		for (int i = 0; i < total ; i++){
			if(Y(i,classi) > 0){
				graphClass.push_back(std::make_pair(X(i,0), X(i,1)));
			}
		}
		graphClasses.push_back(graphClass);
	}

    gp << "set output \"./original_dataset.png\"\n";
    gp << "plot";
	for (int i = 0; i < numClasses ; i++){
        gp << " '-' with points pointtype " << i+1 << " title '" << i+1<<"' ";
        if(i < numClasses-1) gp << " , ";
    }
    gp << "\n";
    for (int i = 0; i < numClasses ; i++) gp.send1d(graphClasses[i]);

    
}

void graphFunction(mat W1, mat W2){
    // Create a X matrix
    int size  = 40;
	mat X(size*size,2,fill::zeros);
	for (int i = 0; i < size; i++){
		for (int j = 0; j < size; j++){
			int index = i*size+j;
			double x = (i / (double)size)*2 - 1;
			double y = (j / (double)size)*2 - 1;
			X(index,0) = x;
			X(index,1) = y;
		}
	}

	mat Y = predict(W1,W2,X);

    Gnuplot gp;
	gp << "set term png\n";

    int total = X.n_rows;
    int numClasses = Y.n_cols;
    std::vector<std::vector<std::pair<double, double> >> graphClasses;
	for (int classi = 0; classi < numClasses ; classi++){
		std::vector<std::pair<double, double>> graphClass;
		for (int i = 0; i < total ; i++){
			if(Y(i,classi) > 0.9){
				graphClass.push_back(std::make_pair(X(i,0), X(i,1)));
			}
		}
		graphClasses.push_back(graphClass);
	}

    gp << "set output \"./result.png\"\n";
    gp << "plot";
	for (int i = 0; i < numClasses ; i++){
        gp << " '-' with points pointtype " << i+1 << " title '" << i+1<<"' ";
        if(i < numClasses-1) gp << " , ";
    }
    gp << "\n";
    for (int i = 0; i < numClasses ; i++) gp.send1d(graphClasses[i]);

    
}