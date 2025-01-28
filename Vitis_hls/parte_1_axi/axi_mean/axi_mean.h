#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
//Funcion que realiza el rectificado y el promedio de las muestras para su posterior normalizacion
const int DATA_SIZE = 512;

void axi_mean(hls::stream<float,512>& in_mv_data, hls::stream<float,512>& out_rect_data, hls::stream<float, 1>& out_mean_data);
