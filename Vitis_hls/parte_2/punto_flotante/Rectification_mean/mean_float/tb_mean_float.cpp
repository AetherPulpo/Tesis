#include "mean_float.h"
#include <iostream>
#include <cassert>
#include <cstdio>

int main(){

	FILE *fp;
	FILE *fp2;
	fp = fopen("../../../../../RectificationValues_hls.dat","r");
	fp2 = fopen("../../../../../MeanValue_hls.dat","w");

    float test_data[DATA_SIZE];
    bool samples_ready = false;
    float test_average;
    float sum = 0.0;
	float expected_average;


//Primero se cargan las muestras ya rectificadas
    for(int i = 0; i < DATA_SIZE; i++){
    	fscanf(fp, "%f",&test_data[i]);
    }

//TESTEO DE LA FUNCION mean_float => Funciona!
    //Se suman todas las muestras rectificadas
    for(int i = 0; i < DATA_SIZE; i++){
    	sum = test_data[i] + sum;
    }
    //Se divide al resultado por la cantidad total de muestras
    	expected_average = sum / DATA_SIZE;

    for(int i = 0; i < DATA_SIZE; i++){
    	if (i == (DATA_SIZE-1)){
    		samples_ready = true;
    	}
    	mean_float(test_data[i], samples_ready, &test_average);
        std::cout << "Entrada: " << test_data[i] << std::endl;
    }
    std::cout << "Promedio esperado: " << expected_average << ", Promedio obtenido: " << test_average << std::endl;
    fprintf(fp2, "%f", test_average);
    fclose(fp);
    fclose(fp2);

    //Verificación
    assert(test_average == expected_average);
    
std::cout << "Testbench Completado con exito" << std::endl;
    return 0;

}   
