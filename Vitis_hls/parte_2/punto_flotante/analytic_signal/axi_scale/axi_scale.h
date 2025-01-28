#include <complex>
#include <cmath>
#include "hls_stream.h"
#include "hls_math.h"
const int NEW_DATA_SIZE = 1024; //Cantidad de muestras

//Se divide la senal a la salida de ifft por 131072 -> 2^17
//Al dividirlo  por 1024 (2^10) se normalizan los valores por la ifft de N = 1024
//Y también se lo divide por 128 (2^7) para escalar los valores y que se encuentren
//dentro del rango adecuado para el proximo bloque

//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;

//Funcion top
void axi_scale (hls::stream<ComplexType, 1024>& in_ifft_data ,hls::stream<ComplexType, 1024>& out_scale_data);
