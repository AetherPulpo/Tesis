#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include "ap_int.h"
typedef ap_axiu<64, 0, 0, 0> axi_stream;
const int ZERO_SIZE = 256;

//Funcion que agrega 256 ceros a las 512 muestras normalizadas
void AXI_zeros(ap_uint<64> in_zeros, hls::stream<axi_stream>& out_stream);
