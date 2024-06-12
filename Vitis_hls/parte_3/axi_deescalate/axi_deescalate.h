#include <complex>
#include <cmath>
#include "hls_stream.h"
#include "hls_math.h"
const int NEW_DATA_SIZE = 1024; //Cantidad de muestras

//Se multiplica la senal a la salida de polar_translate por 128 -> 2^7
//Esto se hace ya que antes del bloque polar_translate lo dividio por 128 (2^7)
//para escalar los valores y que se encuentren dentro del rango adecuado para dicho bloque

//Funcion top
void axi_deescalate (hls::stream<float, 1024>& in_modulus_scale_data ,hls::stream<float, 1024>& out_data);
