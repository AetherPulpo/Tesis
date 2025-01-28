#include "axi_N_zeroes.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[NEW_DATA_SIZE];
    float test_input;
    float test_modulus;
    float expected_result [FILTER_DATA_SIZE];
    float result;
    hls::stream<float, 1024> test_input_stream("stream_entrada");
    hls::stream<float, 1228> test_output_stream ("stream_salida");

    float test_result[FILTER_DATA_SIZE];

	float input_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	test_input = i;
    	input_read[i] = i;
    	test_input_stream.write(test_input);
    }



    //Se aplica la funcion axi cut N
    axi_N_zeroes(test_input_stream, test_output_stream);


    //Se lee el stream de datos de salida
    for(int i = 0; i < FILTER_DATA_SIZE; i++){
       result = test_output_stream.read();
       test_result[i] = result;
    }

    //Se hace la funcion manualmente para comparar
    float tmp;

    for (int i = 0; i < FILTER_DATA_SIZE; i++){
    	if ( i < NEW_DATA_SIZE){
    		expected_result[i] = input_read[i];
    		std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
    		std::cout << "Salida [" << (i) <<"]: " << test_result[(i)] << " Valor esperado: "<< expected_result[i] <<  std::endl;
    		//Se compara el resultado con el resultado esperado
    		assert(test_result[i] == expected_result[i]);
    	}
    	else{
    		expected_result[i] = 0.0;
    		std::cout << "Salida [" << (i) <<"]: " << test_result[(i)] << " Valor esperado: "<< expected_result[i] <<  std::endl;
    		//Se compara el resultado con el resultado esprit
    		assert(test_result[i] == expected_result[i]);
    	}
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
