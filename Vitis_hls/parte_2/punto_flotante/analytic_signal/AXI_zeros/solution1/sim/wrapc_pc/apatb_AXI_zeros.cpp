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
#define AUTOTB_TVIN_in_zeros "../tv/cdatafile/c.AXI_zeros.autotvin_in_zeros.dat"
#define AUTOTB_TVOUT_in_zeros "../tv/cdatafile/c.AXI_zeros.autotvout_in_zeros.dat"
// wrapc file define:
#define AUTOTB_TVIN_out_stream_V_data_V "../tv/cdatafile/c.AXI_zeros.autotvin_out_stream_V_data_V.dat"
#define AUTOTB_TVOUT_out_stream_V_data_V "../tv/cdatafile/c.AXI_zeros.autotvout_out_stream_V_data_V.dat"
#define AUTOTB_TVIN_out_stream_V_keep_V "../tv/cdatafile/c.AXI_zeros.autotvin_out_stream_V_keep_V.dat"
#define AUTOTB_TVOUT_out_stream_V_keep_V "../tv/cdatafile/c.AXI_zeros.autotvout_out_stream_V_keep_V.dat"
#define AUTOTB_TVIN_out_stream_V_strb_V "../tv/cdatafile/c.AXI_zeros.autotvin_out_stream_V_strb_V.dat"
#define AUTOTB_TVOUT_out_stream_V_strb_V "../tv/cdatafile/c.AXI_zeros.autotvout_out_stream_V_strb_V.dat"
#define AUTOTB_TVIN_out_stream_V_last_V "../tv/cdatafile/c.AXI_zeros.autotvin_out_stream_V_last_V.dat"
#define AUTOTB_TVOUT_out_stream_V_last_V "../tv/cdatafile/c.AXI_zeros.autotvout_out_stream_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V "../tv/stream_size/stream_size_out_out_stream_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_data_V "../tv/stream_size/stream_egress_status_out_stream_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V "../tv/stream_size/stream_size_out_out_stream_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_keep_V "../tv/stream_size/stream_egress_status_out_stream_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V "../tv/stream_size/stream_size_out_out_stream_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_strb_V "../tv/stream_size/stream_egress_status_out_stream_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V "../tv/stream_size/stream_size_out_out_stream_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_last_V "../tv/stream_size/stream_egress_status_out_stream_V_last_V.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_in_zeros "../tv/rtldatafile/rtl.AXI_zeros.autotvout_in_zeros.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_out_stream_V_data_V "../tv/rtldatafile/rtl.AXI_zeros.autotvout_out_stream_V_data_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_keep_V "../tv/rtldatafile/rtl.AXI_zeros.autotvout_out_stream_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_strb_V "../tv/rtldatafile/rtl.AXI_zeros.autotvout_out_stream_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_last_V "../tv/rtldatafile/rtl.AXI_zeros.autotvout_out_stream_V_last_V.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  in_zeros_depth = 0;
  out_stream_V_data_V_depth = 0;
  out_stream_V_keep_V_depth = 0;
  out_stream_V_strb_V_depth = 0;
  out_stream_V_last_V_depth = 0;
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
  total_list << "{in_zeros " << in_zeros_depth << "}\n";
  total_list << "{out_stream_V_data_V " << out_stream_V_data_V_depth << "}\n";
  total_list << "{out_stream_V_keep_V " << out_stream_V_keep_V_depth << "}\n";
  total_list << "{out_stream_V_strb_V " << out_stream_V_strb_V_depth << "}\n";
  total_list << "{out_stream_V_last_V " << out_stream_V_last_V_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int in_zeros_depth;
    int out_stream_V_data_V_depth;
    int out_stream_V_keep_V_depth;
    int out_stream_V_strb_V_depth;
    int out_stream_V_last_V_depth;
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
struct __cosim_s8__ { char data[8]; };
struct __cosim_s10__ { char data[16]; };
extern "C" void AXI_zeros_hw_stub_wrapper(__cosim_s8__*, volatile void *);

extern "C" void apatb_AXI_zeros_hw(__cosim_s8__* __xlx_apatb_param_in_zeros, volatile void * __xlx_apatb_param_out_stream) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{sc_bv<128> xlx_stream_out_stream_pc_buffer;
unsigned xlx_stream_out_stream_size = 0;

          std::vector<sc_bv<64> > out_stream_V_data_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_stream_V_data_V);
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
          std::vector<sc_bv<64> > out_stream_V_data_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_stream");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_stream_V_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_stream_size=out_stream_V_data_V_pc_buffer.size();
out_stream_V_data_V_pc_buffer_Copy=out_stream_V_data_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<64> > out_stream_V_keep_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_stream_V_keep_V);
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
          std::vector<sc_bv<64> > out_stream_V_keep_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_stream");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_stream_V_keep_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_stream_size=out_stream_V_keep_V_pc_buffer.size();
out_stream_V_keep_V_pc_buffer_Copy=out_stream_V_keep_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<64> > out_stream_V_strb_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_stream_V_strb_V);
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
          std::vector<sc_bv<64> > out_stream_V_strb_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_stream");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_stream_V_strb_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_stream_size=out_stream_V_strb_V_pc_buffer.size();
out_stream_V_strb_V_pc_buffer_Copy=out_stream_V_strb_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<64> > out_stream_V_last_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_stream_V_last_V);
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
          std::vector<sc_bv<64> > out_stream_V_last_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_stream");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_stream_V_last_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_out_stream_size=out_stream_V_last_V_pc_buffer.size();
out_stream_V_last_V_pc_buffer_Copy=out_stream_V_last_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (int j = 0, e = xlx_stream_out_stream_size; j != e; ++j) {
xlx_stream_out_stream_pc_buffer.range(63, 0) = out_stream_V_data_V_pc_buffer_Copy[j];
xlx_stream_out_stream_pc_buffer.range(71, 64) = out_stream_V_keep_V_pc_buffer_Copy[j];
xlx_stream_out_stream_pc_buffer.range(79, 72) = out_stream_V_strb_V_pc_buffer_Copy[j];
xlx_stream_out_stream_pc_buffer.range(95, 88) = out_stream_V_last_V_pc_buffer_Copy[j];
__cosim_s10__ xlx_stream_elt;
((long long*)&xlx_stream_elt)[0*2+0] = xlx_stream_out_stream_pc_buffer.range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*2+1] = xlx_stream_out_stream_pc_buffer.range(127,64).to_int64();
((hls::stream<__cosim_s10__>*)__xlx_apatb_param_out_stream)->write(xlx_stream_elt);
}}
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//in_zeros
aesl_fh.touch(AUTOTB_TVIN_in_zeros);
aesl_fh.touch(AUTOTB_TVOUT_in_zeros);
//out_stream
aesl_fh.touch(AUTOTB_TVIN_out_stream_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_out_stream_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_out_stream_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_out_stream_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_out_stream_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_out_stream_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_out_stream_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_out_stream_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_last_V);
CodeState = DUMP_INPUTS;
// print in_zeros Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_zeros, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = *((long long*)__xlx_apatb_param_in_zeros);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_in_zeros, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.in_zeros_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_zeros, __xlx_sprintf_buffer.data());
}
std::vector<__cosim_s10__> __xlx_apatb_param_out_stream_stream_buf;
long __xlx_apatb_param_out_stream_stream_buf_size = ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_out_stream)->size();
CodeState = CALL_C_DUT;
AXI_zeros_hw_stub_wrapper(__xlx_apatb_param_in_zeros, __xlx_apatb_param_out_stream);
CodeState = DUMP_OUTPUTS;

//********************** dump C output stream *******************
long __xlx_apatb_param_out_stream_stream_buf_final_size = ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_out_stream)->size() - __xlx_apatb_param_out_stream_stream_buf_size;
{
  while (!((hls::stream<__cosim_s10__>*)__xlx_apatb_param_out_stream)->empty())
    __xlx_apatb_param_out_stream_stream_buf.push_back(((hls::stream<__cosim_s10__>*)__xlx_apatb_param_out_stream)->read());
  for (int i = 0; i < __xlx_apatb_param_out_stream_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_out_stream)->write(__xlx_apatb_param_out_stream_stream_buf[i]);
  }

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_out_stream_stream_buf_final_size; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_out_stream_stream_buf[__xlx_apatb_param_out_stream_stream_buf_size+j])[0*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)&__xlx_apatb_param_out_stream_stream_buf[__xlx_apatb_param_out_stream_stream_buf_size+j])[0*2+1];
sc_bv<64> __xlx_tmp_0_lv = __xlx_tmp_lv.range(63, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_stream_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(71, 64);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_stream_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(79, 72);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_stream_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(95, 88);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_out_stream_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_out_stream_stream_buf_final_size, &tcl_file.out_stream_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_stream_stream_buf_final_size, &tcl_file.out_stream_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_stream_stream_buf_final_size, &tcl_file.out_stream_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_out_stream_stream_buf_final_size, &tcl_file.out_stream_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_stream_V_last_V, __xlx_sprintf_buffer.data());
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_stream_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_stream_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_stream_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_out_stream_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
