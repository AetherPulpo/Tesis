#include "axi_amplitude.h"

//Funcion que calcula la amplitud de las muestras
void axi_amplitude(hls::stream<float, 1024>& in_phase_data,
					hls::stream<float, 1024>& in_modulus_data,
					hls::stream<float, 1024>&  out_amplitude_data){
#pragma HLS INTERFACE axis port=in_phase_data
#pragma HLS INTERFACE axis port=in_modulus_data
#pragma HLS INTERFACE axis port=out_amplitude_data
//		static int counter_0 = 0;
		float tmp_p;
		float tmp_m;
		float result;
		float tmp_cos;
		for(int i = 0; i < NEW_DATA_SIZE ; i++){
		#pragma HLS PIPELINE II=1
			//Leo la muestra
			tmp_p = in_phase_data.read();
			tmp_m = in_modulus_data.read();
			//Calculo la Amplitud
			tmp_cos = hls::cosf(tmp_p);
			result = tmp_cos * tmp_m;
			// Escribo el resultado
			out_amplitude_data.write(result);
//			counter_0++;
		}
//		counter_0 = 0;

}
