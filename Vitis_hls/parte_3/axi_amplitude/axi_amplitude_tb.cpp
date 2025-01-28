#include "axi_amplitude.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_phase_read[NEW_DATA_SIZE];
    float input_modulus_read[NEW_DATA_SIZE];
    float test_phase;
    float test_modulus;
    float expected_result_amplitude [NEW_DATA_SIZE];
    float result_amplitude;

    hls::stream<float, 1024> test_phase_input("stream_entrada_fase");
    hls::stream<float, 1024> test_modulus_input ("stream_entrada_magnitud");
    hls::stream<float, 1024> test_output_amplitude ("stream_salida");

    float test_result_amplitude[NEW_DATA_SIZE];

	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;
	fpr1 = fopen("../../../../../valores_python/fase_filtrada.dat","r");
	fpr2 = fopen("../../../../../valores_python/magnitud_filtrada.dat","r");
	fpw1 = fopen("../../../../../axi_amplitude_values.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	float phase_value;
	float modulus_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &phase_value);
    	fscanf(fpr2, "%f", &modulus_value);
    	test_phase = phase_value;
    	test_modulus = modulus_value;
    	input_phase_read[i] = phase_value;
    	input_modulus_read[i] = modulus_value;
    	test_phase_input.write(test_phase);
    	test_modulus_input.write(test_modulus);
    }

    fclose(fpr1);
    fclose(fpr2);


    //Se aplica la funcion axi amplitude
    axi_amplitude(test_phase_input, test_modulus_input, test_output_amplitude);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result_amplitude = test_output_amplitude.read();
       test_result_amplitude[i] = result_amplitude;
       fprintf(fpw1, "%f\n", result_amplitude);
    }
    fclose(fpw1);

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
        expected_result_amplitude[i] =  hls::cosf(input_phase_read[i])*input_modulus_read[i];
    	std::cout << "Modulo y fase["<< i <<"]: " << input_modulus_read[i] << "; "<<input_phase_read[i]  <<std::endl;
        std::cout << "Amplitud:[" << i <<"]: " << test_result_amplitude[i] << "Valor esperado: "<< expected_result_amplitude[i] <<  std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result_amplitude[i] == expected_result_amplitude[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
