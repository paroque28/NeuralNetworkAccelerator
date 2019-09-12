#include "nn.hpp" 

mat predict(mat W1, mat W2, mat X){
    if(X.n_cols < 3) X = join_rows(ones<mat>(X.n_rows,1),X);
    // std::cout << "---------" << std::endl;
    // std::cout << size(X)<< std::endl;
    // std::cout << size(W1)<< std::endl;
    mat G1 = 1 / (1+exp(-(X*W1.t())));
    mat sigmoid1 = join_rows(ones<mat>(G1.n_rows,1),G1);
    // std::cout << size(sigmoid1)<< std::endl;
    // std::cout << size(W2)<< std::endl;
    mat P2= sigmoid1*W2.t();
    mat G2 = 1 / (1+exp(-P2));
    // std::cout << size(G2)<< std::endl;
    return G2;
}

std::vector<mat> gradtarget(mat W1, mat W2, mat X, mat Y){
    std::vector<mat> gWeights;
    mat P1 = X*W1.t();

    mat G1 = 1 / (1+exp(-P1));
    mat sigmoid1 = join_rows(ones<mat>(G1.n_rows,1),G1);

    mat P2= sigmoid1*W2.t();
    mat Y_hat = 1 / (1+exp(-P2));

    // Back-propagation

    mat delta_2 = -(Y-Y_hat);

    mat sumDeltaJ = delta_2*W2.cols(1, W2.n_cols-1);
    mat derivZj = (1 - G1) % G1;
    mat sigmaJ = derivZj % sumDeltaJ;
    mat gW1 = sigmaJ.t()*X;
    mat gW2 = delta_2.t()*sigmoid1;

    //Normalization

    gW1 = gW1/X.n_rows;
    gW2 = gW2/X.n_rows;

    gWeights.push_back(gW1);
    gWeights.push_back(gW2);
    return gWeights;

}

double target(mat W1, mat W2, mat X, mat Y){
    mat Y_hat=predict(W1,W2,X);
    mat delta = Y - Y_hat;
    mat delta_2 = square(delta);
    double sumDelta = accu(accu(delta_2));
    return 0.5 * sumDelta;
}

std::vector<mat> train(mat W1,mat W2,mat X_in,mat Y, float lambda,int batchSize, float threshold){
    std::cout << "Batch Size: " << batchSize << '\n';
    std::vector<mat> weights;
    int iterations = 0;
    double J, J_0;

    std::vector<mat> gWeights;
    mat W, dW; // [W1 W2]

    mat X = join_rows(ones<mat>(X_in.n_rows,1),X_in);

    mat XY_samples, X_samples, Y_samples;
    
    do {
        iterations++;
        XY_samples = shuffle(join_rows(X,Y));
        X_samples = XY_samples.cols(0, X.n_cols-1);
        Y_samples = XY_samples.cols(X.n_cols, XY_samples.n_cols-1);
        J_0 = target(W1,W2,X,Y);
        
        gWeights = gradtarget(W1,W2,X_samples,Y_samples);
        mat gW1 = gWeights[0];
        mat gW2 = gWeights[1];

        W  = join_cols(vectorise(W1),vectorise(W2));
        dW = join_cols(vectorise(gW1),vectorise(gW2));

        W = W-(lambda*dW);

        W1 = reshape(W.rows(0,W1.n_rows*W1.n_cols-1), W1.n_rows, W1.n_cols);
        W2 = reshape(W.rows(W1.n_rows*W1.n_cols,W.n_rows-1), W2.n_rows, W2.n_cols);

        J = target(W1,W2,X,Y);
        if (iterations % 100 == 0 ){
            std::cout << "|J - J_0|: " << fabs(J-J_0) << std::endl;
        }
        if (iterations % 500 == 0 ){
            graphFunction(W1,W2);
        }
    }
    while(fabs(J-J_0)>threshold);

    // std::cout << "Y:\n" << Y;
    // std::cout << "Y_hat:\n" << predict(W1,W2,X);
    std::cout << "Iterations: " << iterations << '\n';
    std::cout << "Error: " << J << '\n';
    

    weights.push_back(W1);
    weights.push_back(W2);
    return weights;
}