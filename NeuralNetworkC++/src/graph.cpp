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