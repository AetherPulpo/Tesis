#include <complex>
#include "hls_stream.h"
const int DATA_SIZE = 512; //Cantidad de muestras
const int NEW_DATA_SIZE = 1024; //Nueva cantidad de muestras
const int ZERO_SIZE = 256;

//Como los datos de entrada para la FFT son complejos y los datos de salida del bloque de normalizacion
//son reales. Este bloque se encarga de convertir los valores reales a complejos
//agregando un 0 en la parte imaginaria


//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;

//Funcion top
void complex_concatenate (hls::stream<float>& in_data,hls::stream<ComplexType>& out_data);
