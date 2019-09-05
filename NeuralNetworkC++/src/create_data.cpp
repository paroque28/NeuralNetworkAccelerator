#include "create_data.hpp" 

matrixes create_data(int numSamples,int numClasses, std::string shape){
    const std::string radial = "radial";
    std::vector<mat> data;
    mat X = mat(numSamples,2,fill::zeros); // Two dimensions
    mat Y = mat(numSamples,numClasses,fill::zeros);

    if (shape.compare(radial) == 0){
        std::cout << "Radial shape style selected!" << std::endl;

        mat angles= mat(numSamples,1,fill::randu);
        mat radii = mat(numSamples,1,fill::randu);
        mat index = mat(numSamples,1,fill::zeros);
        angles  = angles * (2* boost::math::constants::pi<double>());

        for (int i = 0 ; i < numSamples; i++){
            index(i) = floor(radii(i)*numClasses);
            X(i,0) = radii(i)*cos(angles(i));
            X(i,1) = radii(i)*sin(angles(i));
            Y(i,index(i)) = 1;
        }
    }
    else {
        std::cerr << "Not recognized shape style: " << shape << std::endl;
    }
    data.push_back(X);
    data.push_back(Y);
    return data;
}