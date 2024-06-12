#include "axi_polar_translate_v2.h"

//calcula la magnitud y fase de un stream de datos complejo
void axi_polar_translatev2(hls::stream<ComplexType, 1024>& in_data,
					hls::stream<float, 1024>&  out_modulus,
					hls::stream<float, 1024>&  out_phase){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=out_modulus
#pragma HLS INTERFACE axis port=out_phase
	  static int counter_0 = 0;
		ComplexType tmp;
		ComplexType result;

		loop: do{

			//Leo la muestra
			tmp = in_data.read();
			//Calcula el modulo
			float modulus = hls::sqrtf( (tmp.real() * tmp.real() ) + ( tmp.imag() * tmp.imag() ) );;
			//Calcula la fase
			float phase = hls::atan2f(tmp.imag(),tmp.real());
			// Escribo el resultado
			out_modulus.write(modulus);
			out_phase.write(phase);
			counter_0++;
		}while (counter_0 < NEW_DATA_SIZE);
		counter_0 = 0;

}
