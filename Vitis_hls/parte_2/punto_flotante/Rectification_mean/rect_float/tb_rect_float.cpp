#include "rect_float.h"
#include <iostream>
#include <cassert>
#include <cstdio>

int main(){

	FILE *fp;
	FILE *fp2;
	fp = fopen("../../../../../MvValues_hls.dat","r");
	fp2 = fopen("../../../../../RectificationValues_hls.dat","w");

	//Declaro variables
    float test_data[DATA_SIZE];
    float expected_result[DATA_SIZE];
    float test_output;
    float result[DATA_SIZE];


//Primero se carga valores entre [-1 +1] mv
    for(int i = 0; i < DATA_SIZE; i++){
    	fscanf(fp, "%f",&test_data[i]);
    }

//TESTEO DE LA FUNCION abs_pre_mean => Funciona!
    for(int i = 0; i < DATA_SIZE; i++){
		if (test_data[i] < 0){
			expected_result[i] = -test_data[i];
		}
		else{
			expected_result[i] = test_data[i];
		}
    }

    for(int i = 0; i < DATA_SIZE; i++){
    	rect_float(test_data[i], &test_output);
    	result[i] = test_output;
    	fprintf(fp2,"%f\n",result[i]);
        std::cout << "Entrada: " << test_data[i]  << ", Resultado esperado: " << expected_result[i] << ", Resultado obtenido: " << result[i]  << std::endl;
    }
    fclose(fp);
    fclose(fp2);
      //Verificación
    for(int i = 0; i < DATA_SIZE; i++){
        assert(expected_result[i] == result[i]);
    }
    
std::cout << "Testbench Completado con exito" << std::endl;
    return 0;

}   
