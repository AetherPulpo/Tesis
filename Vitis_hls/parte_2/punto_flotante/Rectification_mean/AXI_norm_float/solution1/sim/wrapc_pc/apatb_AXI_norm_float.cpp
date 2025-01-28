#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_in_rect_data "../tv/cdatafile/c.AXI_norm_float.autotvin_in_rect_data.dat"
#define AUTOTB_TVOUT_in_rect_data "../tv/cdatafile/c.AXI_norm_float.autotvout_in_rect_data.dat"
// wrapc file define:
#define AUTOTB_TVIN_in_mean "../tv/cdatafile/c.AXI_norm_float.autotvin_in_mean.dat"
#define AUTOTB_TVOUT_in_mean "../tv/cdatafile/c.AXI_norm_float.autotvout_in_mean.dat"
// wrapc file define:
#define AUTOTB_TVIN_out_norm_data_V "../tv/cdatafile/c.AXI_norm_float.autotvin_out_norm_data_V.dat"
#define AUTOTB_TVOUT_out_norm_data_V "../tv/cdatafile/c.AXI_norm_float.autotvout_out_norm_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_norm_data_V "../tv/stream_size/stream_size_out_out_norm_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_norm_data_V "../tv/stream_size/stream_egress_status_out_norm_data_V.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_in_rect_data "../tv/rtldatafile/rtl.AXI_norm_float.autotvout_in_rect_data.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_in_mean "../tv/rtldatafile/rtl.AXI_norm_float.autotvout_in_mean.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_out_norm_data_V "../tv/rtldatafile/rtl.AXI_norm_float.autotvout_out_norm_data_V.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  in_rect_data_depth = 0;
  in_mean_depth = 0;
  out_norm_data_V_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{in_rect_data " << in_rect_data_depth << "}\n";
  total_list << "{in_mean " << in_mean_depth << "}\n";
  total_list << "{out_norm_data_V " << out_norm_data_V_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int in_rect_data_depth;
    int in_mean_depth;
    int out_norm_data_V_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void AXI_norm_float_hw_stub_wrapper(volatile void *, float, volatile void *);

extern "C" void apatb_AXI_norm_float_hw(volatile void * __xlx_apatb_param_in_rect_data, float __xlx_apatb_param_in_mean, volatile void * __xlx_apatb_param_out_norm_data) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_in_rect_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > in_rect_data_pc_buffer(512);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "in_rect_data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              in_rect_data_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
		    int i = 0;
            for (int j = 0, e = 512; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_in_rect_data)[j] = in_rect_data_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_out_norm_data_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_out_norm_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_out_norm_data_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_norm_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > out_norm_data_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_norm_data_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_norm_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
float xlx_stream_elt;

            ((int*)&xlx_stream_elt)[0] = out_norm_data_V_pc_buffer[j].to_int64();
          ((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//in_rect_data
aesl_fh.touch(AUTOTB_TVIN_in_rect_data);
aesl_fh.touch(AUTOTB_TVOUT_in_rect_data);
//in_mean
aesl_fh.touch(AUTOTB_TVIN_in_mean);
aesl_fh.touch(AUTOTB_TVOUT_in_mean);
//out_norm_data_V
aesl_fh.touch(AUTOTB_TVIN_out_norm_data_V);
aesl_fh.touch(AUTOTB_TVOUT_out_norm_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_norm_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_norm_data_V);
CodeState = DUMP_INPUTS;
// print in_rect_data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_rect_data, __xlx_sprintf_buffer.data());
    if (__xlx_apatb_param_in_rect_data) {
    for (int j = 0  - 0, e = 512 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_in_rect_data)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_in_rect_data, __xlx_sprintf_buffer.data()); 
      }
  }

  tcl_file.set_num(512, &tcl_file.in_rect_data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_rect_data, __xlx_sprintf_buffer.data());
}
// print in_mean Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_mean, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_in_mean);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_in_mean, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.in_mean_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_mean, __xlx_sprintf_buffer.data());
}
std::vector<float> __xlx_apatb_param_out_norm_data_stream_buf;
long __xlx_apatb_param_out_norm_data_stream_buf_size = ((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->size();
CodeState = CALL_C_DUT;
AXI_norm_float_hw_stub_wrapper(__xlx_apatb_param_in_rect_data, __xlx_apatb_param_in_mean, __xlx_apatb_param_out_norm_data);
CodeState = DUMP_OUTPUTS;
// print in_rect_data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_in_rect_data, __xlx_sprintf_buffer.data());
    if (__xlx_apatb_param_in_rect_data) {
    for (int j = 0  - 0, e = 512 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_in_rect_data)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_in_rect_data, __xlx_sprintf_buffer.data()); 
      }
  }

  tcl_file.set_num(512, &tcl_file.in_rect_data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_in_rect_data, __xlx_sprintf_buffer.data());
}
long __xlx_apatb_param_out_norm_data_stream_buf_final_size = ((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->size() - __xlx_apatb_param_out_norm_data_stream_buf_size;
{
  while (!((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->empty())
    __xlx_apatb_param_out_norm_data_stream_buf.push_back(((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->read());
  for (int i = 0; i < __xlx_apatb_param_out_norm_data_stream_buf.size(); ++i)
    ((hls::stream<float>*)__xlx_apatb_param_out_norm_data)->write(__xlx_apatb_param_out_norm_data_stream_buf[i]);
  }
// print out_norm_data_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_norm_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_out_norm_data_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_out_norm_data_stream_buf[__xlx_apatb_param_out_norm_data_stream_buf_size+j])[0];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_out_norm_data_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_out_norm_data_stream_buf_final_size, &tcl_file.out_norm_data_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_norm_data_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_norm_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_norm_data_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_norm_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_norm_data_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
