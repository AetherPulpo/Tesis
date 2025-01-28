#include "axi_add_zeroes.h"

//Funcion que agrega 256 ceros antes y después de las 512 muestras originales
void axi_add_zeroes(hls::stream<ComplexType, 512>& in_data,
			 hls::stream<ComplexType, 1024>&  out_data){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_data
	ComplexType in_stream[DATA_SIZE];
	ComplexType tmp;
	ComplexType result;
		loop_stream : for(int j = 0; j < NEW_DATA_SIZE ; j++){
			//Leo la muestra
			if(j < DATA_SIZE){
				tmp = in_data.read();
				in_stream[j] = tmp;
			}
			if(j < 256){
				result = {0.0,0.0};
			}
			else if (j > (ZERO_SIZE-1) && j < (ZERO_SIZE+DATA_SIZE)){
				result = in_stream[j-ZERO_SIZE];
			}
			else{
				result = {0.0,0.0};
			}
			// Escribo el resultado
			out_data.write(result);
		}
}
