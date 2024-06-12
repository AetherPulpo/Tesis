#include "axi_deescalate.h"

//Se multiplica la senal a la salida de polar_translate por 128 -> 2^7
//Esto se hace ya que antes del bloque polar_translate lo dividio por 128 (2^7)
//para escalar los valores y que se encuentren dentro del rango adecuado para dicho bloque

void axi_deescalate (hls::stream<float, 1024>& in_modulus_scale_data ,hls::stream<float, 1024>& out_data){
#pragma HLS interface axis port=in_modulus_scale_data
#pragma HLS interface axis port=out_data

	static int counter_0 = 0;
	float tmp;
	float result;
	float scaled = 128.0;
	loop: do{
		//Leo la muestra
		tmp = in_modulus_scale_data.read();

		//Aplico el desescalado
		result = tmp * scaled;
		// Escribo el resultado
		out_data.write(result);
		counter_0++;
	}while (counter_0 < NEW_DATA_SIZE);
	counter_0 = 0;
}
