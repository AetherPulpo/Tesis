#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include "ap_int.h"
typedef ap_axiu<16, 0, 0, 0> axi_stream;


//Funcion que configura la FFT
void axi_config(ap_uint<16> in_config, hls::stream<axi_stream>& out_stream);
