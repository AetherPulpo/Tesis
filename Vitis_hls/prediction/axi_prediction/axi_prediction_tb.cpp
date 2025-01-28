#include "axi_prediction.h"
#include <iostream>
#include <cassert>


int main(){
    int counter;
    float input_read[DATA_SIZE];
    float test_input;
    float test_amp;
    float test_max;
    int expected_result[DATA_SIZE];
    int result;
    bool not_correct =  false;
    hls::stream<float, 512> test_input_stream("stream_entrada_datos");
    hls::stream<float, 1> test_amp_input_stream ("stream_entrada_amp");
    hls::stream<float, 1> test_max_input_stream ("stream_entrada_max");
    hls::stream<int> test_ctremor_output_stream ("stream_salida_current_tremor");
    hls::stream<int> test_ptremor_output_stream ("stream_salida_pred_tremor");
    int test_result[DATA_SIZE];
    int test_result_ptremor[DATA_SIZE];
    int result_ptremor;
    int expected_result_ptremor [DATA_SIZE];
	FILE *fpr1;
	FILE *fpr2;
	FILE *fpr3;
	FILE *fpr4;
	FILE *fpr5;
	FILE *fpw1;
	FILE *fpw2;
	fpr1 = fopen("../../../../../valores_python/comparar_ventana_6.dat","r");
	fpr2 = fopen("../../../../../valores_python/comparar_amp.dat","r");
	fpr3 = fopen("../../../../../valores_python/comparar_max.dat","r");
	fpr4 = fopen("../../../../../valores_python/comparar_time_for_next_burst.dat","r");
	fpr5 = fopen("../../../../../valores_python/comparar_burst_index.dat","r");
	fpw1 = fopen("../../../../../valores_python/burst_index.dat","w");
	fpw2 = fopen("../../../../../valores_python/time_for_next_burst.dat","w");
	assert(fpr1 != NULL && "Error al abrir el archivo fpr1");
	assert(fpr2 != NULL && "Error al abrir el archivo fpr2");
	assert(fpr3 != NULL && "Error al abrir el archivo fpr3");
	assert(fpr4 != NULL && "Error al abrir el archivo fpr2");
	assert(fpr5 != NULL && "Error al abrir el archivo fpr3");
	float input_value, input_value2, input_value3;
	float modulus_value;




	//Se lee los archivos de entrada
    for (int i = 0; i < DATA_SIZE; i++){
    	fscanf(fpr1, "%f", &input_value);
    	test_input = input_value;
    	input_read[i] = input_value;
    	test_input_stream.write(test_input);
    }
    //SE PRUEBA VENTANA 1 => no hay temblor
    fscanf(fpr2, "%f", &input_value2);
    test_amp = input_value2;
    test_amp_input_stream.write(test_amp);
    fscanf(fpr3, "%f", &input_value3);
    test_max = input_value3;
    test_max_input_stream.write(test_max);


    //Se aplica la funcion axi tremor_amp
    axi_prediction(test_input_stream, test_amp_input_stream, test_max_input_stream, test_ctremor_output_stream, test_ptremor_output_stream);

    fscanf(fpr4, "%f", &result_ptremor);
    expected_result_ptremor[0] = result_ptremor;
    fscanf(fpr5, "%f", &result);
    expected_result[0] = result;

    result = test_ctremor_output_stream.read();
    test_result[0] = result;
    fprintf(fpw1, "%f\n", result);
    result_ptremor = test_ptremor_output_stream.read();
    test_result_ptremor[0] = result_ptremor;
    fprintf(fpw2, "%f\n", result_ptremor);
    std::cout << "Ventana 1 :"  <<  std::endl;
    std::cout << "burst_index : " << test_result[0] << " Valor esperado: "<< expected_result[0] <<  std::endl;
    std::cout << "time for next burst : " << test_result_ptremor[0] << " Valor esperado: "<< expected_result_ptremor[0] <<  std::endl;

    //Se compara el resultado con el resultado esperado
    assert(abs(test_result[0] - expected_result[0]) <= 1);
    assert(abs(test_result_ptremor[0] - expected_result_ptremor[0]) <= 1);

    //FIN VENTANA 1
    //Se lee los archivos de entrada
     for (int i = 0; i < DATA_SIZE; i++){
    	 test_input_stream.write(input_read[i]);
     }

    //SE PRUEBA VENTANA 6
    fscanf(fpr2, "%f", &input_value2);
    test_amp = input_value2;
    test_amp_input_stream.write(test_amp);
    fscanf(fpr3, "%f", &input_value3);
    test_max = input_value3;
    test_max_input_stream.write(test_max);




    //Se aplica la funcion axi tremor_amp
    axi_prediction(test_input_stream, test_amp_input_stream, test_max_input_stream, test_ctremor_output_stream, test_ptremor_output_stream);



    //Se lee el stream de datos de salida
    int cnt = 1;
    while (!test_ctremor_output_stream.empty()){
		result = test_ctremor_output_stream.read();
		test_result[cnt] = result;
		cnt += 1;
		fprintf(fpw1, "%d\n", result);
    }
    cnt = 1;
    while (!test_ptremor_output_stream.empty()){
		result_ptremor = test_ptremor_output_stream.read();
		test_result_ptremor[cnt] = result_ptremor;
		cnt += 1;
		fprintf(fpw2, "%d\n", result_ptremor);
    }



    //Se lo compara con el resultado en python. Se acepta cuando el error es igual o menor al 1%
    for (int i = 1; i < 4; i++){
		fscanf(fpr4, "%d", &result_ptremor);
		expected_result_ptremor[i] = result_ptremor;
    }
    for (int i = 1; i < 5; i++){
		fscanf(fpr5, "%d", &result);
		expected_result[i] = result;
    }
    fclose(fpr1);
    fclose(fpr2);
    fclose(fpr3);
    fclose(fpr4);
    fclose(fpr5);
    fclose(fpw1);
    fclose(fpw2);
    std::cout << "Ventana 6 :"  <<  std::endl;
    for (int i = 1; i < 5; i++){
		std::cout << "burst_index : " << test_result[i] << " Valor esperado: "<< expected_result[i] <<  std::endl;
		//Se compara el resultado con el resultado esperado
		assert(abs(test_result[i] - expected_result[i]) <= 0.001);
		if (i < 4){
			std::cout << "time for next burst : " << test_result_ptremor[i] << " Valor esperado: "<< expected_result_ptremor[i] <<  std::endl;
			//Se compara el resultado con el resultado esperado

			assert(abs(test_result_ptremor[i] - expected_result_ptremor[i]) <= 0.001);
		}
    }

//    if (abs(test_result[i] - expected_result[i]) > 0.001){
//    	assert(not_correct == true);
//    }

    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
