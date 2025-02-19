#include "AXI_Real2Complex.h"

//Como los datos de entrada para la FFT son complejos y los datos de salida del bloque de normalizacion
//son reales. Este bloque se encarga de convertir los valores reales a complejos
//agregando un 0 en la parte imaginaria

void AXI_Real2Complex (hls::stream<float>& in_data,hls::stream<ComplexType>& out_data){
#pragma HLS interface axis port=in_data
#pragma HLS interface axis port=out_data

    static int counter_0 = 0;
	float tmp;
	ComplexType result;

	loop: do{
//#pragma HLS PIPELINE II=1
		//Leo la muestra
		tmp = in_data.read();

		//Convierto la muestra real a un valor complejo
		result = {tmp, 0};

		// Escribo el resultado
		out_data.write(result);
		counter_0++;
	}while (counter_0 < DATA_SIZE);
	counter_0 = 0;
}
