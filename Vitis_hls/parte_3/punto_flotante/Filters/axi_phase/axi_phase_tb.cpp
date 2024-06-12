#include "axi_phase.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[NEW_DATA_SIZE];
    ComplexType test;
    float expected_result_phase [NEW_DATA_SIZE];
    float result_phase;

    hls::stream<ComplexType, 1024> test_input("stream_entrada");
    hls::stream<float, 1024> test_output_phase ("stream_salida_fase");
    float test_result_phase[NEW_DATA_SIZE];

	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw2;
	fpr1 = fopen("../../../../../ifft_re_rtl.txt","r");
	fpr2 = fopen("../../../../../ifft_im_rtl.txt","r");
	fpw2 = fopen("../../../../../axi_phase_hls.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	float real_value;
	float imag_value;
	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &real_value);
    	fscanf(fpr2, "%f", &imag_value);
    	test = {real_value/1024, imag_value/1024};
    	input_read[i] = {real_value/1024, imag_value/1024};
    	test_input.write(test);
    }

    fclose(fpr1);
    fclose(fpr2);


    //Se aplica la funcion analytic_fft
    axi_phase(test_input, test_output_phase);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result_phase = test_output_phase.read();
       test_result_phase[i] = result_phase;
       fprintf(fpw2, "%f\n", result_phase);
    }
    fclose(fpw2);
    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
        expected_result_phase[i] = hls::atan2f(input_read[i].imag() , input_read[i].real());
    	std::cout << "Entrada["<< i <<"]: " << input_read[i] << std::endl;
        std::cout << "Fase [" << i <<"]: "<< test_result_phase[i] << "Valor esperado: "<< expected_result_phase[i]   <<  std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result_phase[i] == expected_result_phase[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
