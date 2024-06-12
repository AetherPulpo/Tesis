#include"axi_config.h"
#include <iostream>
#include <cassert>

int main(){
	ap_uint<16> test_data = 1;
    axi_stream expected_result;
    axi_stream result;
    hls::stream<axi_stream> test_output ("stream_salida");
    axi_stream test_result;;

    //Se aplica la funcion axi_zero
    axi_config(test_data, test_output);


    //Se lee el stream de datos de salida

       result = test_output.read();
       test_result = result;


    //Se hace la funcion manualmente para comparar
        expected_result.data = 1;

        std::cout << "Entrada : " << test_data << " Salida: " << test_result.data <<std::endl;
        //Se compara el resultado con el resultado esperado
        assert(test_result.data == expected_result.data);
    std::cout << "Testbench exitoso!" << std::endl;
    return 0;
}
