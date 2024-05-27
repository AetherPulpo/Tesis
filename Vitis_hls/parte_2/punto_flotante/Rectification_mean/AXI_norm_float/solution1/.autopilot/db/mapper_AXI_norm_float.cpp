#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_out_norm_data_V_cap_bc;
static AESL_RUNTIME_BC __xlx_out_norm_data_V_size_Reader("../tv/stream_size/stream_size_out_out_norm_data_V.dat");
extern "C" void AXI_norm_float(volatile void *, float, float*);
extern "C" void apatb_AXI_norm_float_hw(volatile void * __xlx_apatb_param_in_rect_data, float __xlx_apatb_param_in_mean, volatile void * __xlx_apatb_param_out_norm_data) {
  //Create input buffer for out_norm_data
  ap_apatb_out_norm_data_V_cap_bc = __xlx_out_norm_data_V_size_Reader.read_size();
  float* __xlx_out_norm_data_input_buffer= new float[ap_apatb_out_norm_data_V_cap_bc];
  // DUT call
  AXI_norm_float(__xlx_apatb_param_in_rect_data, __xlx_apatb_param_in_mean, __xlx_out_norm_data_input_buffer);
  for (unsigned i = 0; i <ap_apatb_out_norm_data_V_cap_bc; ++i)
    ((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->write(__xlx_out_norm_data_input_buffer[i]);
}
