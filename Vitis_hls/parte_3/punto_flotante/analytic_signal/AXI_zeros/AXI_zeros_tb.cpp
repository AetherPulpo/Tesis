#include"AXI_zeros.h"
#include <iostream>
#include <cassert>

int main(){
	ap_uint<64> test_data = 0;
    axi_stream expected_result [ZERO_SIZE];
    axi_stream result;
    hls::stream<axi_stream> test_output ("stream_salida");
    hls::stream<axi_stream> test_output2 ("stream_salida2");
    axi_stream test_result[ZERO_SIZE];
    axi_stream test_result2[ZERO_SIZE];

	FILE *fpw1;

	fpw1 = fopen("../../../../../axi_zeros.dat","w");

    //Se aplica la funcion axi_zero
    AXI_zeros(test_data, test_output);


    //Se lee el stream de datos de salida
    for(int i = 0; i < ZERO_SIZE; i++){
       result = test_output.read();
       test_result[i] = result;
       fprintf(fpw1, "%f\n", result.data);
    }
    fclose(fpw1);

    //Se hace la funcion manualmente para comparar
    for (int i = 0; i < ZERO_SIZE; i++){

        expected_result[i].data = 0;
        expected_result[i].last = 0;
        if (i == ZERO_SIZE-1){
        	expected_result[i].last = 1;
        }
        std::cout << " Salida [" << i <<"]: " << test_result[i].data <<"TLAST :" << test_result[i].last <<std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result[i].data == expected_result[i].data);
        assert(test_result[i].last == expected_result[i].last);
    }

    AXI_zeros(test_data, test_output2);
    for (int i= 0; i < ZERO_SIZE; i++){
    	result = test_output2.read();
    	test_result2[i] = result;
    	assert(test_result2[i].data == expected_result[i].data);
    	assert(test_result2[i].last == expected_result[i].last);
    }
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
