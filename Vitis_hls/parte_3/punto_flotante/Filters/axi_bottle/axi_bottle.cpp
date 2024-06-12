#include "axi_bottle.h"

//calcula la fase de un stream de datos complejo
void axi_bottle(hls::stream<ComplexType, 1024>& in_complex_data,
			   hls::stream<ComplexType, 1024>& out_complex_data_1,
			   hls::stream<ComplexType, 1024>& out_complex_data_2){
#pragma HLS INTERFACE axis port=in_complex_data
#pragma HLS INTERFACE axis port=out_complex_data_1
#pragma HLS INTERFACE axis port=out_complex_data_2
		ComplexType tmp;
		for (int i = 0; i < NEW_DATA_SIZE; i++){
			//Leo la muestra
			tmp = in_complex_data.read();

			// Escribo el resultado
			out_complex_data_1.write(tmp);
			out_complex_data_2.write(tmp);
		}
}
