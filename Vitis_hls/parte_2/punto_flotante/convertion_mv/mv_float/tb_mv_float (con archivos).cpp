#include "mv_float.h"
#include <iostream>
#include <cassert>


// Testbench para simular la función EMG_values_mv
void testbench() {
    // Crear instancias para entrada y salida

	FILE *fp;
	FILE *fp2;
	fp = fopen("../../../../../InputValues.dat","r");
	fp2 = fopen("../../../../../MvValues_hls.dat","w");

	ap_uint<10> raw_data[512];
	float result[512];
	float expected_result[512];
	float mv;
//	ap_uint<10> input_data_1 = 514;
//	ap_uint<10> input_data_2 = 510;
//	ap_uint<10> input_data_3 = 512;
//   float result_case_1, result_case_2, result_case_3;

    //Primero se carga 512 muestras en RAW => entre [0 1023]
    //Se lee el archivo y se almacenan las 512 muestras en el
    //array raw_data
        for(int i = 0; i < DATA_SIZE; i++){
        	fscanf(fp, "%i",&raw_data[i]);
        }

    //Se testea la funcion float_mv
        for(int i =0; i < DATA_SIZE; i++){
        	expected_result[i] = ((((static_cast<float>(raw_data[i])/ 1024.0) - 0.5) * 3.3) * 1000.0) / 1009.0;
        }

    //Se aplica la funcion float_mv
        for(int i =0; i < DATA_SIZE; i++){
        	mv_float(raw_data[i], &mv);
        	result[i] = mv;
        	//Almaceno los resultados en el archivo MvValues_hls
        	fprintf(fp2,"%f\n",result[i]);
        	//std::cout << "Entrada: " << raw_data[i] << ", Resultado esperado: " << expected_result[i] << ", Resultado obtenido: " << result[i] << std::endl;
        }

    fclose(fp);
    fclose(fp2);
    //Verificacion
    for(int i = 0; i < DATA_SIZE; i++){
    	std::cout << "Entrada: " << raw_data[i] << ", Resultado esperado: " << expected_result[i] << ", Resultado obtenido: " << result[i] << std::endl;std::cout << "Entrada: " << raw_data[i] << ", Resultado esperado: " << expected_result[i] << ", Resultado obtenido: " << result[i] << std::endl;
    	assert(result[i] == expected_result[i]);
	}

    std::cout << "Testbench completado con éxito." << std::endl;
}

int main() {
    // Ejecutar el testbench
    testbench();

    return 0;
}
