#include "axi_phase.h"

//calcula la fase de un stream de datos complejo
void axi_phase(hls::stream<ComplexType, 1024>& in_complex_data,
			   hls::stream<float, 1024>&  out_phase){
#pragma HLS INTERFACE axis port=in_complex_data
#pragma HLS INTERFACE axis port=out_phase
	  static int counter_0 = 0;
		ComplexType tmp;
		ComplexType result;

		for (int i = 0; i < NEW_DATA_SIZE; i++){
			//Leo la muestra
			tmp = in_complex_data.read();
			//Calcula la fase
			float phase = hls::atan2f(tmp.imag(),tmp.real());
			// Escribo el resultado
			out_phase.write(phase);
		}
}
