#include "axi_scale.h"

//Se divide la senal a la salida de ifft por 131072 -> 2^17
//Al dividirlo  por 1024 (2^10) se normalizan los valores por la ifft de N = 1024
//Y también se lo divide por 128 (2^7) para escalar los valores y que se encuentren
//dentro del rango adecuado para el proximo bloque

void axi_scale (hls::stream<ComplexType, 1024>& in_ifft_data ,hls::stream<ComplexType, 1024>& out_scale_data){
#pragma HLS interface axis port=in_ifft_data
#pragma HLS interface axis port=out_scale_data

	static int counter_0 = 0;
	ComplexType tmp;
	ComplexType result;
	float re;
	float im;
	float scaled = 131072.0;
	loop: do{
		//Leo la muestra
		tmp = in_ifft_data.read();

		//Aplico el escalado
		re = hls::dividef(tmp.real(), scaled);
		im = hls::dividef(tmp.imag(), scaled);
		result = {re, im};
		// Escribo el resultado
		out_scale_data.write(result);
		counter_0++;
	}while (counter_0 < NEW_DATA_SIZE);
	counter_0 = 0;
}
