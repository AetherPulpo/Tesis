#include "axi_stream_norm.h"
#include <iostream>
#include <cassert>


// Testbench para simular la función axi stream norm
void testbench() {
    // Crear instancias para entrada y salida

	FILE *fp;
	FILE *fp2;
	FILE *fp3;
	fp = fopen("../../../../../valores_python/parte1/comparar_mv.dat","r");
	fp2 = fopen("../../../../../valores_python/parte1/comparar_mean.dat","r");
	fp3 = fopen("../../../../../valores_python/parte1/comparar_norm.dat","r");

	float rect_data[DATA_SIZE];
	float tmp_input;
	float tmp_rect;
	float expected_mean;

	float tmp_result;
	float tmp_mean;
	float expected_result[512];
	float mv;
    hls::stream<float, 512> test_in_rect_stream("stream_entrada_datos");
    hls::stream<float, 1> test_in_mean_stream ("stream_salida_mean");
    hls::stream<float, 512> test_out_norm_stream ("stream_salida");


    //Primero se carga 512 muestras de entrada
        for(int i = 0; i < DATA_SIZE; i++){
        	fscanf(fp, "%f",&tmp_input);
        	if (tmp_input < 0.0){
        		tmp_rect = -tmp_input;
        	}
        	else{
        		tmp_rect = tmp_input;
        	}
        	rect_data[i] = tmp_rect;
        	test_in_rect_stream.write(tmp_rect);

        	fscanf(fp3, "%f",&tmp_result);
        	expected_result[i] = tmp_result;
        }
        fscanf(fp2, "%f",&expected_mean);
        tmp_mean = expected_mean;
        test_in_mean_stream.write(tmp_mean);
        fclose(fp);
        fclose(fp2);
        fclose(fp3);
		//Se aplica la funcion axi_mean
		axi_stream_norm(test_in_rect_stream, test_in_mean_stream,test_out_norm_stream);



    //Verificacion con los valores de python
    for(int i = 0; i < DATA_SIZE; i++){
    	tmp_result = test_out_norm_stream.read();
    	std::cout << "Entrada["<<i<<"]: " << rect_data[i] << std::endl;
    	std::cout << " Norm esperado: " << expected_result[i] << ", Norm obtenido: " << tmp_result << std::endl;
    	assert(abs(tmp_result - expected_result[i]) <= 0.001);
	}
    std::cout << "Testbench completado con éxito." << std::endl;
}

int main() {
    // Ejecutar el testbench
    testbench();

    return 0;
}
