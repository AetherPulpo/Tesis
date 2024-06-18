#include"AXI_zeros.h"

//Funcion que agrega 256 ceros a las 512 muestras normalizadas
void AXI_zeros(ap_uint<64> in_zeros, hls::stream<axi_stream>& out_stream){
	#pragma HLS INTERFACE axis port=out_stream
	axi_stream tmp;
	static int counter = 0;
	bool last = false;
	loop_stream : for(int j = 0; j < ZERO_SIZE ; j++){
#pragma HLS PIPELINE II=1
		tmp.data = in_zeros;
		if (j == 255){
			tmp.last = 1;
		}
		else{
			tmp.last = 0;
		}
		tmp.keep = -1;
		// Escribo un 0 de 64 bits a la salida
		out_stream.write(tmp);
		counter++;
		if (tmp.last){
			last = true;
		}
	}
}
