#include "axi_tremor_amp.h"

//Funcion que amplifica la señal, calcula su promedio y le aplica raiz cuadrada
void axi_tremor_amp(hls::stream<float, 512>& in_data,
			 hls::stream<float, 1>&  out_amp_data,
			 hls::stream<float, 1>& out_max_data){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_amp_data
#pragma HLS INTERFACE axis port=out_max_data
		//Declaro variables
		float tmp;
		float tmp_pow;
		float tmp_mean;
		static float sum = 0.0;
		static float tmp_max = 0.0;
		float result;

		loop_stream : for(int j = 0; j < DATA_SIZE ; j++){
#pragma HLS pipeline II=2
			//Leo la muestra
			tmp = in_data.read();
			//Se eleva al cuadrado
			tmp_pow = hls::powf(tmp,2);
			//Se almacena la suma para su posterior promedio
			sum = sum + tmp_pow;
			//Se busca la muestra que posee el valor maximo
			tmp_max = hls::fmaxf(tmp_max, tmp);

			if ( j == (DATA_SIZE-1)){
				//Se aplica el promedio
				tmp_mean  = sum / static_cast <float>(DATA_SIZE);
				//Se aplica la raiz cuadrada al promedio
				result = hls::sqrtf(tmp_mean);
				// Escribo el resultado
				out_amp_data.write(result);
				out_max_data.write(tmp_max);
			}
		}
		//Se vuelve a iniciar las variables estaticas
		sum = 0.0;
		tmp_max = 0.0;
}
