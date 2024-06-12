#include "mv_float.h"

//Si se necesitan cambiar los valores, hacerlos en el header file
//offset = 0.5;
//VCC = 3.3;
//G = 1009.0;
//two_power_n = 1024.0;  // ADC de 10 bits
//milivolts = 1000.0;



void mv_float(ap_uint<10> in_data, float* out_data) {
#pragma HLS INTERFACE ap_ctrl_chain port=return
#pragma HLS INTERFACE ap_none port=in_data
#pragma HLS INTERFACE ap_none port=out_data
#pragma HLS pipeline II=1

    // Aplicar la conversión y la ecuación
	*out_data = (((static_cast<float>(in_data) / two_power_n) - offset) * VCC * milivolts) / G;

}
