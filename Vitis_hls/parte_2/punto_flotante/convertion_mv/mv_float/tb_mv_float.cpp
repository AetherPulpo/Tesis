#include "mv_float.h"
#include <iostream>
#include <cassert>


// Testbench para simular la función EMG_values_mv
void testbench() {
    // Crear instancias para entrada y salida
	ap_uint<10> input_data_1 = 514;
	ap_uint<10> input_data_2 = 510;
	ap_uint<10> input_data_3 = 512;
    float result_case_1, result_case_2, result_case_3;

    // Caso 1: Entrada positiva

    mv_float(input_data_1, &result_case_1);
    float expected_result_case_1 = ((((514.0 / 1024.0) - 0.5) * 3.3) * 1000.0) / 1009.0;
    std::cout << "Caso 1 - Resultado esperado: " << expected_result_case_1 << ", Resultado real: " << result_case_1 << std::endl;


    // Caso 2: Entrada negativa
    mv_float(input_data_2, &result_case_2);
    float expected_result_case_2 = ((((510.0 / 1024.0) - 0.5) * 3.3) * 1000.0) / 1009.0;
    std::cout << "Caso 2 - Resultado esperado: " << expected_result_case_2 << ", Resultado real: " << result_case_2 << std::endl;


    // Caso 3: Entrada cero
    mv_float(input_data_3, &result_case_3);
    float expected_result_case_3 = (((((512.0 / 1024.0) - 0.5) * 3.3) * 1000.0) / 1009.0);
    std::cout << "Caso 3 - Resultado esperado: " << expected_result_case_3 << ", Resultado real: " << result_case_3 << std::endl;


    // Se puede agregar más casos
    assert(result_case_1 == expected_result_case_1);
    assert(result_case_2 == expected_result_case_2);
    assert(result_case_3 == expected_result_case_3);

    std::cout << "Testbench completado con éxito." << std::endl;
}

int main() {
    // Ejecutar el testbench
    testbench();

    return 0;
}
