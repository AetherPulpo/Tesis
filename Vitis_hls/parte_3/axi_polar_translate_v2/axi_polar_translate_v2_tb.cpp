#include "axi_polar_translate_v2.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[NEW_DATA_SIZE];
    ComplexType test;
    float expected_result_modulus [NEW_DATA_SIZE];
    float expected_result_phase [NEW_DATA_SIZE];
    float result_modulus;
    float result_phase;

    hls::stream<ComplexType, 1024> test_input("stream_entrada");
    hls::stream<float, 1024> test_output_modulus ("stream_salida_modulo");
    hls::stream<float, 1024> test_output_phase ("stream_salida_fase");
    float test_result_modulus[NEW_DATA_SIZE];
    float test_result_phase[NEW_DATA_SIZE];

	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;
	FILE *fpw2;
	fpr1 = fopen("../../../../../hilbert_re_py.txt","r");
	fpr2 = fopen("../../../../../hilbert_im_py.txt","r");
	fpw1 = fopen("../../../../../axipolar_translate_modulus_v2.dat","w");
	fpw2 = fopen("../../../../../axipolar_translate_phase_v2.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	float real_value;
	float imag_value;
	float test_escalado = 1/131072;
	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &real_value);
    	fscanf(fpr2, "%f", &imag_value);
    	test = {real_value, imag_value};
    	input_read[i] = {real_value, imag_value};
    	test_input.write(test);
    }

    fclose(fpr1);
    fclose(fpr2);


    //Se aplica la funcion analytic_fft
    axi_polar_translatev2 (test_input, test_output_modulus, test_output_phase);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result_modulus = test_output_modulus.read();
       result_phase = test_output_phase.read();
       test_result_modulus[i] = result_modulus;
       test_result_phase[i] = result_phase;
       fprintf(fpw1, "%f\n", result_modulus);
       fprintf(fpw2, "%f\n", result_phase);
    }
    fclose(fpw1);
    fclose(fpw2);
    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
        expected_result_modulus[i] =  hls::sqrtf( (input_read[i].real() * input_read[i].real() ) + ( input_read[i].imag() * input_read[i].imag() ) );
    	//expected_result_modulus[i] =  abs(input_read[i]);
        expected_result_phase[i] = hls::atan2f(input_read[i].imag() , input_read[i].real());
    	std::cout << "Entrada["<< i <<"]: " << input_read[i] << std::endl;
        std::cout << "Modulo [" << i <<"]: " << test_result_modulus[i] << "Valor esperado: "<< expected_result_modulus[i] <<  std::endl;
        std::cout << "Fase [" << i <<"]: "<< test_result_phase[i] << "Valor esperado: "<< expected_result_phase[i]   <<  std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result_modulus[i] == expected_result_modulus[i]);
        assert(test_result_phase[i] == expected_result_phase[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
