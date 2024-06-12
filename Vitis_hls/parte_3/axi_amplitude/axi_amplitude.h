#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int NEW_DATA_SIZE = 1024;

//Funcion que calcula la amplitud de las muestras
void axi_amplitude(hls::stream<float, 1024>& in_phase_data,
					hls::stream<float, 1024>& in_modulus_data,
					hls::stream<float, 1024>&  out_amplitude_data);
