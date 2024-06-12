#include "axi_bottle.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[NEW_DATA_SIZE];
    ComplexType test_input;
    ComplexType expected_result_1 [NEW_DATA_SIZE];
    ComplexType expected_result_2 [NEW_DATA_SIZE];
    ComplexType result_1;
    ComplexType result_2;
    bool compare =  false;
    hls::stream<ComplexType, 1024> test_input_stream("stream_entrada");
    hls::stream<ComplexType, 1024> test_output_stream_1 ("stream_salida_1");
    hls::stream<ComplexType, 1024> test_output_stream_2 ("stream_salida_2");

    ComplexType test_result_1[NEW_DATA_SIZE];
    ComplexType test_result_2[NEW_DATA_SIZE];

	float input_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	test_input = {i,i};
    	input_read[i] = {i,i};
    	test_input_stream.write(test_input);
    }



    //Se aplica la funcion axi bottle
    axi_bottle(test_input_stream, test_output_stream_1, test_output_stream_2);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result_1 = test_output_stream_1.read();
       result_2 = test_output_stream_2.read();
       test_result_1[i] = result_1;
       test_result_2[i] = result_2;
    }

    //Se hace la funcion manualmente para comparar

    for (int i = 0; i < NEW_DATA_SIZE; i++){
    		expected_result_1[i] = {i,i};
    		expected_result_2[i] = {i,i};
    		std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
    		std::cout << "Salida_1 [" << (i) <<"]: " << test_result_1[(i)] << " Valor esperado: "<< expected_result_1[i] <<  std::endl;
    		std::cout << "Salida_2 [" << (i) <<"]: " << test_result_2[(i)] << " Valor esperado: "<< expected_result_2[i] <<  std::endl;
    		//Se compara el resultado con el resultado esperado
    		assert(test_result_1[i] == expected_result_1[i]);
    		assert(test_result_2[i] == expected_result_2[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
