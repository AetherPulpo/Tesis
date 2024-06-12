#include "axi_modulus.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[NEW_DATA_SIZE];
    ComplexType test;
    float expected_result_modulus [NEW_DATA_SIZE];
    float result_modulus;

    hls::stream<ComplexType, 1024> test_input("stream_entrada");
    hls::stream<float, 1024> test_output_modulus ("stream_salida_modulo");

    float test_result_modulus[NEW_DATA_SIZE];


	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;

	fpr1 = fopen("../../../../../ifft_re_rtl.txt","r");
	fpr2 = fopen("../../../../../ifft_im_rtl.txt","r");
	fpw1 = fopen("../../../../../modulus_values_hls.dat","w");

	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	float real_value;
	float imag_value;
	//Se lee los archivos de entrada
	//IMPORTANTE: SE DIVIDE POR 1024 YA QUE LOS VALORES DE ifft_rtl.txt
	//no estan normalizados. Una vez divididos por N = 1024
	//Se pueden comparar con los resultados en Python
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
    axi_modulus (test_input, test_output_modulus);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result_modulus = test_output_modulus.read();

       test_result_modulus[i] = result_modulus;

       fprintf(fpw1, "%f\n", result_modulus);
    }
    fclose(fpw1);

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
        expected_result_modulus[i] =  hls::sqrtf( (input_read[i].real() * input_read[i].real() ) + ( input_read[i].imag() * input_read[i].imag() ) );


    	std::cout << "Entrada["<< i <<"]: " << input_read[i] << std::endl;
        std::cout << "Modulo [" << i <<"]: " << test_result_modulus[i] << "Valor esperado: "<< expected_result_modulus[i] <<  std::endl;

        //Se compara el resultado con el resultado esperado
        assert(test_result_modulus[i] == expected_result_modulus[i]);

    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
