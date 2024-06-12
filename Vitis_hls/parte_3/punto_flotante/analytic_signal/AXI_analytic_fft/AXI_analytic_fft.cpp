#include "AXI_analytic_fft.h"


//Se multiplica la fft de la senal de entrada de tal forma para obtener la fft de la senal analitica
// el motivo de esto se debe a lo investigado en
// "Computing the Discrete-Time Analytic Signal via FFT" marple 1999

void axi_analytic_fft (hls::stream<ComplexType>& in_data ,hls::stream<ComplexType>& out_data, bool* TLAST){
#pragma HLS interface axis port=in_data
#pragma HLS interface axis port=out_data
#pragma HLS interface ap_none port=TLAST

	static int counter = 0;
	ComplexType tmp;
	ComplexType result;
	bool last = false;
	
	loop: do{
#pragma HLS PIPELINE II=1

		//Leo la muestra
		tmp = in_data.read();
		
		//Aplico el algoritmo para obtener la fft de la senal analitica
		if( counter == 0 || counter == (DATA_SIZE/2) ){
			result = tmp;
		}
		else if (counter > (DATA_SIZE/2) ) {
			result = {0,0};
		}
		else{
			result = {static_cast<float>(tmp.real()*2.0) , static_cast<float>(tmp.imag()*2.0)};
		}
		
		// Escribo el resultado
		out_data.write(result);
		*TLAST = last;
		
		counter++;
		if(counter == DATA_SIZE-1){
			last = true;
		}
		
	}while (counter < DATA_SIZE);
	counter = 0;
}
