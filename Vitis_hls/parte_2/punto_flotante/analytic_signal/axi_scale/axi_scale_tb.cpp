#include "axi_scale.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[NEW_DATA_SIZE];
    ComplexType test;
    ComplexType expected_result [NEW_DATA_SIZE];
    ComplexType result;

    hls::stream<ComplexType, 1024> test_input("stream_entrada");
    hls::stream<ComplexType, 1024> test_output ("stream_salida");
    ComplexType test_result [NEW_DATA_SIZE];
    float test_escalado = 1/131072;
	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;
	FILE *fpw2;
	fpr1 = fopen("../../../../../ifft_re_rtl.txt","r");
	fpr2 = fopen("../../../../../ifft_im_rtl.txt","r");
	fpw1 = fopen("../../../../../axi_scale_re.dat","w");
	fpw2 = fopen("../../../../../axi_scale_im.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	float real_value;
	float imag_value;
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
    axi_scale(test_input, test_output);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result = test_output.read();
       test_result[i] = result;
       fprintf(fpw1, "%f\n", result.real());
       fprintf(fpw2, "%f\n", result.imag());
    }
    fclose(fpw1);
    fclose(fpw2);
    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
        expected_result[i] = {hls::dividef(input_read[i].real(), 131072.0), hls::dividef(input_read[i].imag(), 131072.0)} ;
    	std::cout << "Entrada["<< i <<"]: " << input_read[i] << std::endl;
        std::cout << "Resultado escalado [" << i <<"]: " << test_result[i] << "Valor esperado: "<< expected_result[i] <<  std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result[i] == expected_result[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
