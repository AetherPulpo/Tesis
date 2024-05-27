#include"axi_config.h"

//Funcion que configura la FFT
void axi_config(ap_uint<16> in_config, hls::stream<axi_stream>& out_stream){
	#pragma HLS INTERFACE axis port=out_stream
	#pragma HLS INTERFACE ap_none port=in_config

		axi_stream tmp;

		tmp.data = in_config;

		out_stream.write(tmp);
}
