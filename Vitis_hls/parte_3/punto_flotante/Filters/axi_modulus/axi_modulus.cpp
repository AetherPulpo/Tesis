#include "axi_modulus.h"

//calcula la magnitud de un stream de datos complejo
void axi_modulus(hls::stream<ComplexType, 1024>& in_complex_data,
				 hls::stream<float, 1024>&  out_modulus){
#pragma HLS INTERFACE axis port=in_complex_data
#pragma HLS INTERFACE axis port=out_modulus

	  static int counter_0 = 0;
		ComplexType tmp;
		ComplexType result;

		for (int i = 0; i < NEW_DATA_SIZE; i++){
			//Leo la muestra
			tmp = in_complex_data.read();
			//Calcula el modulo
			float modulus = hls::sqrtf( (tmp.real() * tmp.real() ) + ( tmp.imag() * tmp.imag() ) );
			// Escribo el resultado
			out_modulus.write(modulus);
		}
}
