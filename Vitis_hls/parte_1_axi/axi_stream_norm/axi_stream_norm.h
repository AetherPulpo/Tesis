#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int DATA_SIZE = 512;
//Funcion que normaliza las muestras
void axi_stream_norm(hls::stream<float, 512>& in_rect_data,
		  	  	hls::stream<float, 1> &  in_mean_data,
				hls::stream<float, 512>& out_norm_data);
