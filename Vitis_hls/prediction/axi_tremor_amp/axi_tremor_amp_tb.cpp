#include "axi_tremor_amp.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[DATA_SIZE];
    float test_input;
    float test_modulus;
    float expected_result;
    float result;
    bool not_correct =  false;
    hls::stream<float, 512> test_input_stream("stream_entrada");
    hls::stream<float, 1> test_amp_output_stream ("stream_salida_amp");
    hls::stream<float, 1> test_max_output_stream ("stream_salida_max");
    float test_result;
    float test_result_max;
    float result_max;
    float expected_result_max;
	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;
	fpr1 = fopen("../../../../../valores_python/comparar_iir_512.dat","r");
	fpr2 = fopen("../../../../../valores_python/comparar_amp.dat","r");
	fpw1 = fopen("../../../../../valores_python/amp_value.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	float input_value;
	float modulus_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &input_value);
    	test_input = input_value;
    	input_read[i] = input_value;
    	test_input_stream.write(test_input);
    }

    fclose(fpr1);


    //Se aplica la funcion axi tremor_amp
    axi_tremor_amp(test_input_stream, test_amp_output_stream, test_max_output_stream);


    //Se lee el stream de datos de salida

    result = test_amp_output_stream.read();
    test_result = result;
    fprintf(fpw1, "%f\n", result);
    result_max = test_max_output_stream.read();
    test_result_max = result_max;
    fprintf(fpw1, "%f\n", result_max);
    fclose(fpw1);

    //Se lo compara con el resultado en python. Se acepta cuando el error es igual o menor al 1%
    fscanf(fpr2, "%f", &result);
    expected_result = result;
    fscanf(fpr2, "%f", &result_max);
    expected_result_max = result_max;
    for (int i = 0; i <DATA_SIZE; i++){
    	std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
    }
    std::cout << "Salida amp : " << test_result << " Valor esperado: "<< expected_result <<  std::endl;
    std::cout << "Salida max : " << test_result_max << " Valor esperado: "<< expected_result_max <<  std::endl;
    //Se compara el resultado con el resultado esperado
    assert(abs(test_result - expected_result) <= 0.001);
    assert(abs(test_result_max - expected_result_max) <= 0.001);
//    if (abs(test_result[i] - expected_result[i]) > 0.001){
//    	assert(not_correct == true);
//    }
    fclose(fpr2);
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
