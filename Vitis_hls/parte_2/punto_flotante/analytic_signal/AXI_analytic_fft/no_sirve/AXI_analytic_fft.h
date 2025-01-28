#include <complex>
#include "hls_stream.h"
const int DATA_SIZE = 512; //Cantidad de muestras

//funcion que se encarga de obtener la fft de la senal anilitica teniendo como entrada la fft de una senal
//Su salida es la fft de la senal analitica


//alias para simplificar el uso de números complejos
using ComplexType = std::complex<float>;

struct axi_complex{
  ComplexType data;
  bool last;
};


//Funcion top donde, partiendo de un stream de datos que es la fft de una senal,
//se obtiene la fft de la senal analitica
void axi_analytic_fft (hls::stream<axi_complex>& in_data ,hls::stream<axi_complex>& out_data);
