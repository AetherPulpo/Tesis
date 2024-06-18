#include "hls_stream.h"
#include <complex>
const int DATA_SIZE = 512  ;
const int NEW_DATA_SIZE = 1024;
const int ZERO_SIZE = 256; //N cantidad de muestras a eliminar
//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;


//Funcion que agrega 256 ceros antes y después de las 512 muestras originales
void axi_add_zeroes(hls::stream<ComplexType, 512>& in_data,
			 hls::stream<ComplexType, 1024>&  out_data);
