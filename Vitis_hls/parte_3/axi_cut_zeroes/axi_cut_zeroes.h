#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int DATA_SIZE = 512  ;
const int NEW_DATA_SIZE = 1024;
const int FILTER_DATA_SIZE = 1228;
const int ZERO_SIZE = 256; //N cantidad de muestras a eliminar

//Funcion que elimina los 256 ceros agregados antes y después de las 512 muestras originales
void axi_cut_zeroes(hls::stream<float, 1024>& in_data,
			 	 	hls::stream<float, 512>&  out_cut_data);
