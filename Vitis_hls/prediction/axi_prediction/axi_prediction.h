#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int DATA_SIZE = 512;
const int MEM_SIZE = 256;

void axi_prediction(hls::stream<float, 512>& in_data,
			 hls::stream<float, 1>&  in_amp_data,
			 hls::stream<float, 1>& in_max_data,
			 hls::stream<int> & out_current_tremor,
			 hls::stream<int>& out_predict_tremor);
