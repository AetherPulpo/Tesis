#include "axi_cut_zeroes.h"

//Funcion que elimina los 256 ceros agregados antes y después de las 512 muestras originales
void axi_cut_zeroes(hls::stream<float, 1024>& in_data,
			 hls::stream<float, 512>&  out_cut_data){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_cut_data

		float tmp;
		float result;
		loop_stream : for(int j = 0; j < NEW_DATA_SIZE ; j++){
			//Leo la muestra
			tmp = in_data.read();
			if ( j > ZERO_SIZE-1 && j < NEW_DATA_SIZE-ZERO_SIZE){
				result = tmp;

				// Escribo el resultado
				out_cut_data.write(result);
			}
		}
}
