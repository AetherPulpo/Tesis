#include "axi_mv.h"
#include <iostream>
#include <cassert>


// Testbench para simular la función EMG_values_mv
void testbench() {
    // Crear instancias para entrada y salida

	FILE *fp;
	FILE *fp2;
	fp = fopen("../../../../../valores_python/parte1/input_values.dat","r");
	fp2 = fopen("../../../../../valores_python/parte1/comparar_mv.dat","r");

	ap_uint<10> raw_data[DATA_SIZE];
	ap_uint<10> tmp_input;

	float tmp_result;
	float expected_result[512];
	float mv;
    hls::stream<ap_uint<10>, 512> test_input_stream("stream_entrada_datos");
    hls::stream<float, 512> test_output_stream ("stream_salida_datos");
//	ap_uint<10> input_data_1 = 514;
//	ap_uint<10> input_data_2 = 510;
//	ap_uint<10> input_data_3 = 512;
//   float result_case_1, result_case_2, result_case_3;

    //Primero se carga 512 muestras de entrada
        for(int i = 0; i < DATA_SIZE; i++){
        	fscanf(fp, "%d",&tmp_input);
        	raw_data[i] = tmp_input;
        	test_input_stream.write(tmp_input);

        	fscanf(fp2, "%f",&tmp_result);
        	expected_result[i] = tmp_result;
        }
        fclose(fp);
        fclose(fp2);
		//Se aplica la funcion float_mv
		axi_mv(test_input_stream, test_output_stream);



    //Verificacion con los valores de python
    for(int i = 0; i < DATA_SIZE; i++){
    	tmp_result = test_output_stream.read();

    	std::cout << "Entrada["<<i<<"]: " << raw_data[i] << ", Resultado esperado: " << expected_result[i] << ", Resultado obtenido: " << tmp_result << std::endl;
    	assert(abs(tmp_result - expected_result[i]) <= 0.001);
	}

    std::cout << "Testbench completado con éxito." << std::endl;
}

int main() {
    // Ejecutar el testbench
    testbench();

    return 0;
}
