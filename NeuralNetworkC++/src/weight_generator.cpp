#include "weight_generator.hpp" 

matrix weight_generator(int number_neurons, int number_inputs){

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(0, 1);//uniform distribution between 0 and 1

    matrix m; 

    m.resize(number_neurons,number_inputs); 
    for(int i = 0; i<number_neurons*number_inputs;++i) {
        m(i/number_neurons,i%number_inputs)= dis(gen); 
    }
    return m; 
}