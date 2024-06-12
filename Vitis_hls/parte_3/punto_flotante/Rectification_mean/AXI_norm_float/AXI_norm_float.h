#include "hls_stream.h"
const int DATA_SIZE = 512;
//Funcion que obtiene el promedio de la senal
void AXI_norm_float(volatile float  in_rect_data[512],
		  	  	float  in_mean,
				hls::stream<float>& out_norm_data);
