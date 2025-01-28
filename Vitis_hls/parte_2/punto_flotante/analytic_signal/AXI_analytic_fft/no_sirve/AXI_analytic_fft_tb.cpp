#include "AXI_analytic_fft.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[DATA_SIZE];
    ComplexType X_m;  //FFT de una senal de entrada
    bool test_last = false;
    axi_complex test = {X_m,test_last};
    ComplexType Z_m [DATA_SIZE]; // FFT de la senal analitica
    axi_complex expected_result [DATA_SIZE];
    axi_complex result;

    	std::cout << "Sea X_m la FFT de una senal de entrada x_n en el dominio de las frecuencias" << std::endl;
        std::cout << "y en "<<DATA_SIZE<< " X_m siempre es "<< X_m << std::endl;
        std::cout << "Y sea Z_m la FFT de la senal analitica z_n que corresponde a x_n" << std::endl;

    hls::stream<axi_complex> test_input;
    hls::stream<axi_complex> test_output;
    axi_complex test_result[DATA_SIZE];

	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw;
	fpr1 = fopen("../../../../../fft_512_re.dat","r");
	fpr2 = fopen("../../../../../fft_512_im.dat","r");
	fpw = fopen("../../../../../axiAnalyticFFT_values.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	float real_value;
	float imag_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &real_value);
    	fscanf(fpr2, "%f", &imag_value);
    	test.data = {real_value, imag_value};
    	input_read[i] = {real_value, imag_value};
    	if (i ==DATA_SIZE-1 ){
    		test.last = true;
    	}
    	test_input.write(test);
    }

    fclose(fpr1);
    fclose(fpr2);


    //Se aplica la funcion analytic_fft
    axi_analytic_fft (test_input, test_output);

    //Se lee el stream de datos de salida
    for(int i = 0; i < DATA_SIZE; i++){
       result = test_output.read();
       test_result[i] = result;
       fprintf(fpw, "%f\n", result.data);
    }
    fclose(fpw);

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < DATA_SIZE; i++){

        std::cout << "FFT Entrada X[" << i <<"]: "<< input_read[i]  << " FFT analitica Z[" << i <<"]: " << test_result[i].data << std::endl;

        if(i == 0 || i == (DATA_SIZE/2) ){
            expected_result[i].data = input_read[i];
            expected_result[i].last = false;
        }
        else if( i > (DATA_SIZE/2)){
            expected_result[i].data = {0,0};
            expected_result[i].last = false;
        }
        else{
            expected_result[i].data = {static_cast<float>(input_read[i].real()*2.0) , static_cast<float>(input_read[i].imag() * 2.0)};
            if (i == DATA_SIZE - 1){
            	expected_result[i].last = true;
            }
            else{
            	expected_result[i].last = false;
            }
        }
        //Se compara el resultado con el resultado esperado
        assert(test_result[i].data == expected_result[i].data);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
