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
unsigned int ap_apatb_out_stream_V_cap_bc;
static AESL_RUNTIME_BC __xlx_out_stream_V_size_Reader("../tv/stream_size/stream_size_out_out_stream_V.dat");
struct __cosim_s2__ { char data[2]; };
struct __cosim_s8__ { char data[8]; };
extern "C" void axi_config(__cosim_s2__, __cosim_s8__*);
extern "C" void apatb_axi_config_hw(__cosim_s2__ __xlx_apatb_param_in_config, volatile void * __xlx_apatb_param_out_stream) {
  //Create input buffer for out_stream
  ap_apatb_out_stream_V_cap_bc = __xlx_out_stream_V_size_Reader.read_size();
  __cosim_s8__* __xlx_out_stream_input_buffer= new __cosim_s8__[ap_apatb_out_stream_V_cap_bc];
  // DUT call
  axi_config(__xlx_apatb_param_in_config, __xlx_out_stream_input_buffer);
  for (unsigned i = 0; i <ap_apatb_out_stream_V_cap_bc; ++i)
    ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_out_stream)->write(__xlx_out_stream_input_buffer[i]);
}
