#include "hls_stream.h"
#include <complex>

const int NEW_DATA_SIZE = 1024;
//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;

//calcula la fase de un stream de datos complejo
void axi_bottle(hls::stream<ComplexType, 1024>& in_complex_data,
			   hls::stream<ComplexType, 1024>& out_complex_data_1,
			   hls::stream<ComplexType, 1024>& out_complex_data_2);
