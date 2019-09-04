#include "create_data.hpp" 

matrixes create_data(int numSamples,int numClasses, std::string shape){
    const std::string radial = "radial";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(0, 1);//uniform distribution between 0 and 1
    std::uniform_real_distribution<> pidis(0, 2* boost::math::constants::pi<double>());//uniform distribution between 0 and 2pi
    matrix X, Y ;
    std::vector<matrix> data;
    X.resize(numSamples,2); // Two dimensions
    Y.resize(numSamples,numClasses);

    if (shape.compare(radial) == 0){
        std::cout << "Radial shape style selected!" << std::endl;

        vector angles, radii, index;

        angles.resize(numSamples);
        radii.resize(numSamples);
        index.resize(numSamples);

        for (int i = 0 ; i < numSamples; i++){
            angles(i) = pidis(gen);
            radii(i) = dis(gen);
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