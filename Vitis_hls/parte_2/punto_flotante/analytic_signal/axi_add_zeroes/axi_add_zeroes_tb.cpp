#include "axi_add_zeroes.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[DATA_SIZE];
    ComplexType test_input;
    ComplexType expected_result [NEW_DATA_SIZE];
    ComplexType result;
    hls::stream<ComplexType, 512> test_input_stream("stream_entrada");
    hls::stream<ComplexType, 1024> test_output_stream ("stream_salida");

    ComplexType test_result[NEW_DATA_SIZE];

    ComplexType input_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < DATA_SIZE; i++){
    	if (i == 0){
    		test_input = {0.1,0.0};
    		input_read[i] = {0.1,0.0};

    	}
    	else{
			test_input = {static_cast<float>(i),0.0};
			input_read[i] = {static_cast<float>(i),0.0};
    	}
    	test_input_stream.write(test_input);
    }



    //Se aplica la funcion axi fir
    axi_add_zeroes(test_input_stream, test_output_stream);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result = test_output_stream.read();
       test_result[i] = result;
    }

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	if (i < DATA_SIZE){
    		std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
    	}
    	if (i < ZERO_SIZE){
    		expected_result[i] = {0.0,0.0};
    	}
    	else if (  i > ZERO_SIZE-1 && i < NEW_DATA_SIZE-ZERO_SIZE){
    		expected_result[i] = input_read[i-ZERO_SIZE];
    	}
    	else{
    		expected_result[i] = {0.0,0.0};
    	}
    	std::cout << "Salida [" << (i) <<"]: " << test_result[(i)] << " Valor esperado: "<< expected_result[i] <<  std::endl;
    	//Se compara el resultado con el resultado esperado
    	assert(test_result[i] == expected_result[i]);

    }
//    std::cout << test_output_stream.empty() << std::endl;
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
