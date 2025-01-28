#include "axi_deescalate.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[NEW_DATA_SIZE];
    float test;
    float expected_result [NEW_DATA_SIZE];
    float result;

    hls::stream<float, 1024> test_input("stream_entrada");
    hls::stream<float, 1024> test_output ("stream_salida");
    float test_result [NEW_DATA_SIZE];
    float test_escalado = 1/131072;
	FILE *fpr1;
	FILE *fpw1;
	fpr1 = fopen("../../../../../ifft_re_rtl.txt","r");
	fpw1 = fopen("../../../../../axi_descalate_values.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	float scaled_value;

	//Se lee los archivos de entrada
    for (int i = 0; i < NEW_DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &scaled_value);
    	test = (scaled_value / 131072.0);
    	input_read[i] = test;
    	test_input.write(test);
    }
    fclose(fpr1);


    //Se aplica la funcion axi_deescalate
    axi_deescalate(test_input, test_output);


    //Se lee el stream de datos de salida
    for(int i = 0; i < NEW_DATA_SIZE; i++){
       result = test_output.read();
       test_result[i] = result;
       fprintf(fpw1, "%f\n", result);
    }
    fclose(fpw1);

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < NEW_DATA_SIZE; i++){
        expected_result[i] = input_read[i] * 128.0;
    	std::cout << "Entrada Escalada["<< i <<"]: " << input_read[i] << std::endl;
        std::cout << "Resultado desescalado [" << i <<"]: " << test_result[i] << "Valor esperado: "<< expected_result[i] <<  std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result[i] == expected_result[i]);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
