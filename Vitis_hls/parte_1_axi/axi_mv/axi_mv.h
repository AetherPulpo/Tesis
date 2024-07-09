#include "hls_stream.h"
#include "ap_int.h"
const int DATA_SIZE = 512;
const float offset = 0.5;
const float VCC = 3.3;
const float G = 1009.0;
const float two_power_n = 1024.0;  // ADC de 10 bits
const float milivolts = 1000.0;

// Función que toma un flujo de datos y retorna otro flujo de datos con valores absolutos
void axi_mv(hls::stream<ap_uint<10>,512>& in_raw_data, hls::stream<float, 512>& out_mv_data);
