#include "axi_cut_zeroes.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[NEW_DATA_SIZE];
    float test_input;
    float test_modulus;
    float expected_result [NEW_DATA_SIZE];
    float result;
    bool compare =  false;
    hls::stream<float, 1024> test_input_stream("stream_entrada");
    hls::stream<float, 512> test_output_stream ("stream_salida");

    float test_result[NEW_DATA_SIZE];

	float input_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	test_input = i;
    	input_read[i] = i;
    	test_input_stream.write(test_input);
    }



    //Se aplica la funcion axi fir
    axi_cut_zeroes(test_input_stream, test_output_stream);


    //Se lee el stream de datos de salida
    for(int i = 0; i < DATA_SIZE; i++){
       result = test_output_stream.read();
       test_result[i] = result;
    }

    //Se hace la funcion manualmente para comparar
    float tmp;

    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	if (  i > ZERO_SIZE-1 && i < NEW_DATA_SIZE-ZERO_SIZE){
    		expected_result[i] = input_read[i];
    		std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
    		std::cout << "Salida [" << (i-256) <<"]: " << test_result[(i-256)] << " Valor esperado: "<< expected_result[i] <<  std::endl;
    		//Se compara el resultado con el resultado esperado
    		assert(test_result[i-256] == expected_result[i]);
    	}
    	else{
    		std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
    	}


    }
//    std::cout << test_output_stream.empty() << std::endl;
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
