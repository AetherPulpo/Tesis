#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int DATA_SIZE = 512;


//Funcion que amplifica la señal, calcula su promedio y le aplica raiz cuadrada
void axi_tremor_amp(hls::stream<float, 512>& in_data,
			 hls::stream<float, 1>&  out_amp_data,
			 hls::stream<float, 1>& out_max_data);
