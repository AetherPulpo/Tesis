#include "axi_N_zeroes.h"

//Funcion que agrega N cantidad de ceros
void axi_N_zeroes(hls::stream<float, 1024>& in_data,
			 hls::stream<float, 1228>&  out_data){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_data

		float tmp;
		float result;
		loop_stream : for(int j = 0; j < FILTER_DATA_SIZE ; j++){
			if(j < NEW_DATA_SIZE){
				//Leo la muestra
				tmp = in_data.read();
				// Escribo el resultado
				out_data.write(tmp);
			}
			else{ //añade N=204 ceros
				tmp = 0.0;
				// añade los ceros al stream
				out_data.write(tmp);
			}
		}
}
