#include "axi_cut_N.h"

//Funcion que elimina N cantidad de muestras
void axi_cut_N(hls::stream<float, 1228>& in_data,
			 hls::stream<float, 1024>&  out_cut_data){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_cut_data

		float tmp;
		float result;
		loop_stream : for(int j = 0; j < FILTER_DATA_SIZE ; j++){
			//Leo la muestra
			tmp = in_data.read();
			if ( j > CUT_SIZE-1){
				result = tmp;

				// Escribo el resultado
				out_cut_data.write(result);
			}
		}
}
