#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int NEW_DATA_SIZE = 1024;
const int FILTER_DATA_SIZE = 1228;
const int CUT_SIZE = 204; //N cantidad de muestras a eliminar

//Funcion que elimina N cantidad de muestras
void axi_cut_N(hls::stream<float, 1228>& in_data,
			 hls::stream<float, 1024>&  out_cut_data);
