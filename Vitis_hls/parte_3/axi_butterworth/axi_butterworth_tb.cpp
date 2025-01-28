#include "axi_butterworth.h"
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
    hls::stream<float, 1024> test_output_stream ("stream_salida");

    float test_result[NEW_DATA_SIZE];

	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;
	fpr1 = fopen("../../../../../valores_python/amplitud.dat","r");
	fpr2 = fopen("../../../../../valores_python/comparar_iir.dat","r");
	fpw1 = fopen("../../../../../valores_python/axi_butterworth_values.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	float input_value;
	float modulus_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &input_value);
    	test_input = input_value;
    	input_read[i] = input_value;
    	test_input_stream.write(test_input);
    }

    fclose(fpr1);


    //Se aplica la funcion axi fir
    axi_butterworth(test_input_stream, test_output_stream);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result = test_output_stream.read();
       test_result[i] = result;
       fprintf(fpw1, "%f\n", result);
    }
    fclose(fpw1);

    //Se lo compara con los resultados en python. Se acepta cuando el error es igual o menor al 1%

    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	fscanf(fpr2, "%f", &result);
    	expected_result[i] = result;

    	std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
        std::cout << "Salida Filtrada [" << i <<"] : " << test_result[i] << " Valor esperado: "<< expected_result[i] <<  std::endl;
        //Se compara el resultado con el resultado esperado
        if (abs(test_result[i] - expected_result[i]) > 0.001){
        	assert(compare == true);
        }
    }
    fclose(fpr2);
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
