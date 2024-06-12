#include "axi_fir.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[FILTER_DATA_SIZE];
    float test_input;
    float test_modulus;
    float expected_result [FILTER_DATA_SIZE];
    float result;
    bool compare =  false;
    hls::stream<float, 1228> test_input_stream("stream_entrada");
    hls::stream<float, 1228> test_output_stream ("stream_salida");

    float test_result[FILTER_DATA_SIZE];

	FILE *fpr1;
	FILE *fpr2;
	FILE *fpw1;
	fpr1 = fopen("../../../../../valores_python/fase.dat","r");
	fpr2 = fopen("../../../../../valores_python/comparar_fir_fase.dat","r");
	fpw1 = fopen("../../../../../valores_python/axi_fir_phase_values.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	float input_value;
	float modulus_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < FILTER_DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &input_value);
    	test_input = input_value;
    	input_read[i] = input_value;
    	test_input_stream.write(test_input);
    }

    fclose(fpr1);


    //Se aplica la funcion axi fir
    axi_fir(test_input_stream, test_output_stream);


    //Se lee el stream de datos de salida
    for(int i = 0; i < FILTER_DATA_SIZE; i++){
       result = test_output_stream.read();
       test_result[i] = result;
       fprintf(fpw1, "%f\n", result);
    }
    fclose(fpw1);

    //Se hace la funcion manualmente para comparar
    float tmp;
    float tmp_r;
    static float shift_reg_a[NUM_TAPS];
	for (int i = 0; i < NUM_TAPS; i++){
		shift_reg_a[i] = 0.0;
	}

    for (int i = 0; i < FILTER_DATA_SIZE; i++){
    	fscanf(fpr2, "%f", &result);
    	expected_result[i] = result;

    	//if (i < NEW_DATA_SIZE){
 //   		tmp = input_read[i];
    	//}
    	//else{
    	//	tmp = 0.0;
    	//}
//    	for(int i = NUM_TAPS -1; i > 0; i--){
//    		shift_reg_a[i] = shift_reg_a[i-1];
//    	}
//   	shift_reg_a[0] = tmp;

//    	for (int i = 0; i < NUM_TAPS; i++){
//    		tmp_r += shift_reg_a[i] * taps[i];
//    	}

//        expected_result[i] = tmp_r;
    	std::cout << "Entrada ["<< i <<"]: " << input_read[i] <<std::endl;
        std::cout << "Salida Filtrada [" << i <<"]: " << test_result[i] << "Valor esperado: "<< expected_result[i] <<  std::endl;
        //Se compara el resultado con el resultado esperado
        if (abs(test_result[i] - expected_result[i]) > 0.01){
        	assert(compare == true);
        }
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
