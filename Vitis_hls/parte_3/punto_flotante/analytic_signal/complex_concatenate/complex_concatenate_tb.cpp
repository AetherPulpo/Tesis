#include "complex_concatenate.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[DATA_SIZE];
    bool test_last;
    float test; //Senal de entrada
    ComplexType expected_result [NEW_DATA_SIZE];
    ComplexType result;

    hls::stream<float> test_input ("stream_entrada");
    hls::stream<ComplexType> test_output ("stream_salida");
    ComplexType test_result[NEW_DATA_SIZE];

	FILE *fpr;
	FILE *fpw1;
	FILE *fpw2;
	fpr = fopen("../../../../../NormValues_hls.dat","r");
	fpw1 = fopen("../../../../../Complex_concatenate_re_values.dat","w");
	fpw2 = fopen("../../../../../Complex_concatenate_im_values.dat","w");
	assert(fpr != NULL && "Error al abrir el archivo fpr");


	//Se lee los archivos de entrada
    for (int i = 0; i < DATA_SIZE; i++){
    	fscanf(fpr, "%f", &test);
    	test_input.write(test);
    	input_read[i] = test;
    }
    fclose(fpr);


    //Se aplica la funcion complex_concatenate
    complex_concatenate(test_input, test_output);


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
    	if (i < ZERO_SIZE){
    		std::cout << " Salida Compleja[" << i <<"]: " << test_result[i] << std::endl;
    		expected_result[i] = {0, 0};
    	}
    	else if (i < (DATA_SIZE + ZERO_SIZE)){
    		 std::cout << "Entrada Real[" << i <<"]: "<< input_read[i]  << " Salida Compleja[" << i <<"]: " << test_result[i] << std::endl;
    		 expected_result[i] = {input_read[i-ZERO_SIZE], 0};
    	}
    	else{
    		std::cout << " Salida Compleja[" << i <<"]: " << test_result[i] << std::endl;
    		expected_result[i] = {0, 0};
    	}


        //Se compara el resultado con el resultado esperado
        assert(test_result[i] == expected_result[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
