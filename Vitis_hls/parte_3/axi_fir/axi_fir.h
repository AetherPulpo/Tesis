#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int NEW_DATA_SIZE = 1024;
const int FILTER_DATA_SIZE = 1228;
const int NUM_TAPS = 409;
//coeficientes filtros FIR
const float taps[NUM_TAPS]={
		#include "fir_coefv2.dat"
	};
//Funcion que calcula la amplitud de las muestras
void axi_fir(hls::stream<float, 1228>& in_data,
			 hls::stream<float, 1228>&  out_fir_data);
