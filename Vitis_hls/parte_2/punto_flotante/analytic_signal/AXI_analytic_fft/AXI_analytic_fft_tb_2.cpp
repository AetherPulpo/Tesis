#include "AXI_analytic_fft.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    ComplexType input_read[DATA_SIZE];
    ComplexType X_m = {1,1};  //FFT de una senal de entrada
    //bool test_last
    ComplexType test = X_m;
    ComplexType Z_m [DATA_SIZE]; // FFT de la senal analitica
    ComplexType expected_result [DATA_SIZE];
    ComplexType result;

    	std::cout << "Sea X_m la FFT de una senal de entrada x_n en el dominio de las frecuencias" << std::endl;
        std::cout << "y en "<<DATA_SIZE<< " X_m siempre es "<< X_m << std::endl;
        std::cout << "Y sea Z_m la FFT de la senal analitica z_n que corresponde a x_n" << std::endl;

    hls::stream<ComplexType> test_input("stream_entrada");
    hls::stream<ComplexType> test_output ("stream_salida");
    ComplexType test_result[DATA_SIZE];

	float real_value;
	float imag_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < DATA_SIZE; i++){
    	test_input.write(X_m);
    }

    //Se aplica la funcion analytic_fft
    axi_analytic_fft (test_input, test_output);


    //Se lee el stream de datos de salida
    for(int i = 0; i < DATA_SIZE; i++){
       result = test_output.read();
       test_result[i] = result;
       //fprintf(fpw, "%f\n", result);
    }
   // fclose(fpw);

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < DATA_SIZE; i++){

        std::cout << "FFT Entrada X[" << i <<"]: "<< X_m  << " FFT analitica Z[" << i <<"]: " << test_result[i] << std::endl;

        if(i == 0 || i == (DATA_SIZE/2) ){
            expected_result[i] = X_m;
        }
        else if( i > (DATA_SIZE/2)){
            expected_result[i] = {0,0};
        }
        else{
            expected_result[i] = {static_cast<float>(X_m.real()*2.0) , static_cast<float>(X_m.imag() * 2.0)};

        }
        //Se compara el resultado con el resultado esperado
        assert(test_result[i] == expected_result[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
