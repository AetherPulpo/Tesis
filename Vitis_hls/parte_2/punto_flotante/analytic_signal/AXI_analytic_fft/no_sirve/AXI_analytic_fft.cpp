#include "AXI_analytic_fft.h"


//Se multiplica la fft de la senal de entrada de tal forma para obtener la fft de la senal analitica
// el motivo de esto se debe a lo investigado en
// "Computing the Discrete-Time Analytic Signal via FFT" marple 1999

void axi_analytic_fft (hls::stream<axi_complex>& in_data ,hls::stream<axi_complex>& out_data){
#pragma HLS interface axis port=in_data
#pragma HLS interface axis port=out_data
#pragma HLS INTERFACE s_axilite port=return

	static int counter = 0;
	axi_complex tmp;
	axi_complex result;
	
	loop: do{
#pragma HLS PIPELINE II=1
		//Leo la muestra
		tmp = in_data.read();
		
		//Aplico el algoritmo para obtener la fft de la senal analitica
		if( counter == 0 || counter == (DATA_SIZE/2) ){
			result = tmp;
		}
		else if (counter > (DATA_SIZE/2) ) {
			result.data = {0,0};
			result.last = tmp.last;
		}
		else{
			result.data = {static_cast<float>(tmp.data.real()*2.0) , static_cast<float>(tmp.data.imag()*2.0)};
			result.last = tmp.last;
		}
		
		// Escribo el resultado
		out_data.write(result);
		
		counter++;
		
		
	}while (tmp.last == false);	
}
