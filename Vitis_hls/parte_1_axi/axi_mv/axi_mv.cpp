#include "axi_mv.h"

//Si se necesitan cambiar los valores, hacerlos en el header file
//offset = 0.5;
//VCC = 3.3;
//G = 1009.0;
//two_power_n = 1024.0;  // ADC de 10 bits
//milivolts = 1000.0;
void axi_mv(hls::stream<ap_uint<10>,512>& in_raw_data, hls::stream<float, 512>& out_mv_data) {
#pragma HLS INTERFACE axis port=in_raw_data
#pragma HLS INTERFACE axis port=out_mv_data

	//Declaro variables
	ap_uint<10> tmp1;
	int tmp2;
	float result;

	loop_stream : for(int j = 0; j < DATA_SIZE ; j++){
#pragma HLS pipeline II=1
		//Leo la muestra
		tmp1 =in_raw_data.read();
		tmp2 = static_cast<int>(tmp1);
		// Aplicar la conversión y la ecuación
	    result = (((static_cast<float>(tmp2) / two_power_n) - offset) * VCC * milivolts) / G;

			// Escribo el resultado
		out_mv_data.write(result);

	}
}
