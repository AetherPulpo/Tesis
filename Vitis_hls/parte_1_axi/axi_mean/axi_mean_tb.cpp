#include "axi_mean.h"
#include <iostream>
#include <cassert>


// Testbench para simular la función EMG_values_mv
void testbench() {
    // Crear instancias para entrada y salida

	FILE *fp;
	FILE *fp2;
	fp = fopen("../../../../../valores_python/parte1/comparar_mv.dat","r");
	fp2 = fopen("../../../../../valores_python/parte1/comparar_mean.dat","r");

	float mv_data[DATA_SIZE];
	float tmp_input;
	float expected_mean;

	float tmp_result;
	float tmp_mean;
	float expected_result[512];
	float mv;
    hls::stream<float, 512> test_input_stream("stream_entrada_datos");
    hls::stream<float, 512> test_out_rect_stream ("stream_salida_rect");
    hls::stream<float, 1> test_out_mean_stream ("stream_salida_mean");


    //Primero se carga 512 muestras de entrada
        for(int i = 0; i < DATA_SIZE; i++){
        	fscanf(fp, "%f",&tmp_input);
        	mv_data[i] = tmp_input;
        	test_input_stream.write(tmp_input);

        //	fscanf(fp2, "%f",&tmp_result);
        	expected_result[i] = hls::fabsf(mv_data[i]);
        }
        fscanf(fp2, "%f",&expected_mean);

        fclose(fp);
        fclose(fp2);
		//Se aplica la funcion axi_mean
		axi_mean(test_input_stream, test_out_rect_stream, test_out_mean_stream);



    //Verificacion con los valores de python
    for(int i = 0; i < DATA_SIZE; i++){
    	tmp_result = test_out_rect_stream.read();
    	std::cout << "Entrada["<<i<<"]: " << mv_data[i] << std::endl;
    	std::cout << " Rect esperado: " << expected_result[i] << ", Rect obtenido: " << tmp_result << std::endl;
    	assert(abs(tmp_result - expected_result[i]) <= 0.001);
	}
    	tmp_mean = test_out_mean_stream.read();
    	std::cout << " mean esperado: " << expected_mean << ", mean obtenido: " << tmp_mean << std::endl;
    std::cout << "Testbench completado con éxito." << std::endl;
}

int main() {
    // Ejecutar el testbench
    testbench();

    return 0;
}
