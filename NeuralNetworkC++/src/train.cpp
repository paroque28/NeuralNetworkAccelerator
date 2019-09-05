#include "train.hpp" 

mat predict(mat W1, mat W2, mat X){
    if(X.n_cols < 3) X = join_rows(ones<mat>(X.n_rows,1),X);
    mat P1 = X*W1.t();

    mat G1 = 1 / (1+exp(-P1));
    mat activation1 = join_rows(ones<mat>(G1.n_rows,1),G1);

    mat P2= activation1*W2.t();
    mat G2 = 1 / (1+exp(-P2));

    return G2;
}

std::vector<mat> gradtarget(mat W1, mat W2, mat X, mat Y){
    std::vector<mat> gWeights;
    mat P1 = X*W1.t();

    mat G1 = 1 / (1+exp(-P1));
    mat activation1 = join_rows(ones<mat>(G1.n_rows,1),G1);

    mat P2= activation1*W2.t();
    mat Y_hat = 1 / (1+exp(-P2));

    // Back-propagation

    mat delta_2 = -(Y-Y_hat);

    mat sumDeltaJ = delta_2*W2.cols(1, W2.n_cols-1);
    mat derivZj = (1 - G1) % G1;
    std::cout << "." << std::endl;
    mat sigmaJ = derivZj % sumDeltaJ;
    mat gW1 = sigmaJ.t()*X;
    mat gW2 = delta_2.t()*activation1;

    //Normalization

    gW1 = gW1/X.n_rows;
    gW2 = gW2/X.n_rows;

    gWeights.push_back(gW1);
    gWeights.push_back(gW2);
    return gWeights;

}

double target(mat W1, mat W2, mat X, mat Y){
    mat Y_hat=predict(W1,W2,X);

    double delta_2 = sum(sum(square(Y - Y_hat)));
    return 0.5 * delta_2;
}

std::vector<mat> train(mat W1,mat W2,mat X_in,mat Y, float lambda,int batchSize, float threshold){
    std::cout << "Batch Size: " << batchSize << '\n';
    std::vector<mat> weights;
    int iterations = 0;
    double J, J_initial;

    std::vector<mat> gWeights;
    mat W, dW; // [W1 W2]

    mat X = join_rows(ones<mat>(X_in.n_rows,1),X_in);

    mat XY_samples = shuffle(join_rows(X,Y));
    mat X_samples = XY_samples.cols(0, X.n_cols-1);
    mat Y_samples = XY_samples.cols(X.n_cols, XY_samples.n_cols-1);

    do {
        iterations++;
        J_initial = target(W1,W2,X,Y);
        std::cout << "J: " << J_initial << std::endl;
        
        gWeights = gradtarget(W1,W2,X_samples,Y_samples);
        mat gW1 = gWeights[0];
        mat gW2 = gWeights[1];

        W  = join_cols(vectorise(W1),vectorise(W2));
        dW = join_cols(vectorise(gW1),vectorise(W2));

        W = W-lambda*dW;

        J = target(W1,W2,X,Y);
    }
    while(abs(J-J_initial)<=threshold);

    weights.push_back(W1);
    weights.push_back(W2);
    return weights;
}