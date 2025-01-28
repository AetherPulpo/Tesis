#include "axi_fir.h"

//Funcion que calcula la amplitud de las muestras
void axi_fir(hls::stream<float, 1228>& in_data,
			 hls::stream<float, 1228>&  out_fir_data){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_fir_data
		static float shift_reg_a[NUM_TAPS];
		for (int i = 0; i < NUM_TAPS; i++){
			shift_reg_a[i] = 0.0;
		}
		float tmp;
		float result;
		loop_stream : for(int j = 0; j < FILTER_DATA_SIZE ; j++){
			result = 0.0;
			//Leo la muestra
			tmp = in_data.read();
			//if ( j < NEW_DATA_SIZE){
			//	tmp = in_data.read();
			//}
			//else{
			//	tmp = 0.0;
			//}

			loop_taps : for(int i = NUM_TAPS -1; i > 0; i--){
				shift_reg_a[i] = shift_reg_a[i-1];
			}
				shift_reg_a[0] = tmp;

			loop_result : for (int i = 0; i < NUM_TAPS; i++){
			#pragma HLS pipeline II=1
				result += shift_reg_a[i] * taps[i];
			}
			// Escribo el resultado
			out_fir_data.write(result);
		}

}
