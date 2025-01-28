#include "norm_float.h"
#include <iostream>
#include <cassert>
#include <random>
#include <ctime>

int main(){
	FILE *fp;
	FILE *fpw;
	fp = fopen("../../../../../RectificationValues_hls.dat","r");
	fpw = fopen("../../../../../NormValues_hls.dat","w");
	assert(fp != NULL && "Error al abrir el archivo");

    volatile float test_data[DATA_SIZE];
    volatile float input_data;
    float test_average = 0.017079981; //este es el valor completo que aparece cuando debugeas el código en vitis hls
    float expected_average;
    float sum = 0;
    float expected_result[DATA_SIZE];
    float output_data;
    float result[DATA_SIZE];


    for(int i = 0; i < DATA_SIZE; i++){
    	fscanf(fp, "%f",&test_data[i]);
    }
    fclose(fp);

    for (int i =0; i < DATA_SIZE; i++){
    	sum = test_data[i] + sum;
    }
    	expected_average = sum / DATA_SIZE;

//TESTEO DE LA FUNCION norm_float
    std::cout << "Promedio esperado: " << expected_average <<", Promedio obtenido: " << test_average << std::endl;
    assert(test_average == expected_average);
    for(int i = 0; i < DATA_SIZE; i++){
		norm_float(test_data[i], test_average, &output_data);
		result[i] = output_data;
		expected_result[i] = (test_data[i] / expected_average);
		fprintf(fpw, "%f\n", output_data);
		std::cout << "Entrada: " << test_data[i]  << ", Resultado esperado: " << expected_result[i]<<", Resultado: " << result[i] << std::endl;
	    assert(result[i] == expected_result[i]);
    }
    fclose(fpw);
    std::cout << "Testbench Completado con exito" << std::endl;
    return 0;
}
