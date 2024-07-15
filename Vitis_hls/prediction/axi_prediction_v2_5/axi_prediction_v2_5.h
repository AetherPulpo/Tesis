#include "ap_axi_sdata.h"
#include "hls_stream.h"
#include <cmath>
#include "hls_math.h"
const int DATA_SIZE = 512;
const int MEM_SIZE = 256;
typedef ap_axis<32, 0, 0, 0> axi_stream;
//using axi_stream = hls::axis_data<int,AXIS_ENABLE_LAST>;
void axi_prediction_v2_5(hls::stream<float, 512>& in_data,
			 hls::stream<float, 1>&  in_amp_data,
			 hls::stream<float, 1>& in_max_data,
			// hls::stream<float, 512>& out_tremor_data,
			// hls::stream<axi_stream> & out_current_tremor,
			 hls::stream<axi_stream>& out_predict_tremor);
