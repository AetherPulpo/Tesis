#include <complex>
#include "hls_stream.h"
#include "ap_int.h"
const int DATA_SIZE = 512; //Cantidad de muestras

//Como los datos de entrada para la FFT son complejos y los datos de salida del bloque de normalizacion
//son reales. Este bloque se encarga de convertir los valores reales a complejos
//agregando un 0 en la parte imaginaria


//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;

//Funcion top
void AXI_Real2Complex (hls::stream<float>& in_data ,hls::stream<ComplexType>& out_data);
