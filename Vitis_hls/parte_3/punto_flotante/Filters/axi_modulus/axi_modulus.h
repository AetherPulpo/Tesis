#include "hls_stream.h"
#include <complex>
#include <cmath>
#include "hls_math.h"
const int NEW_DATA_SIZE = 1024;
//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;

//calcula la magnitud de un stream de datos complejo
void axi_modulus(hls::stream<ComplexType, 1024>& in_complex_data,
				 hls::stream<float, 1024>&  out_modulus);
