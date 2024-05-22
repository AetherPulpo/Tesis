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
#define AUTOTB_TVIN_in_data "../tv/cdatafile/c.mean_float.autotvin_in_data.dat"
#define AUTOTB_TVOUT_in_data "../tv/cdatafile/c.mean_float.autotvout_in_data.dat"
// wrapc file define:
#define AUTOTB_TVIN_in_samples_ready "../tv/cdatafile/c.mean_float.autotvin_in_samples_ready.dat"
#define AUTOTB_TVOUT_in_samples_ready "../tv/cdatafile/c.mean_float.autotvout_in_samples_ready.dat"
// wrapc file define:
#define AUTOTB_TVIN_out_mean "../tv/cdatafile/c.mean_float.autotvin_out_mean.dat"
#define AUTOTB_TVOUT_out_mean "../tv/cdatafile/c.mean_float.autotvout_out_mean.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_in_data "../tv/rtldatafile/rtl.mean_float.autotvout_in_data.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_in_samples_ready "../tv/rtldatafile/rtl.mean_float.autotvout_in_samples_ready.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_out_mean "../tv/rtldatafile/rtl.mean_float.autotvout_out_mean.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  in_data_depth = 0;
  in_samples_ready_depth = 0;
  out_mean_depth = 0;
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
  total_list << "{in_data " << in_data_depth << "}\n";
  total_list << "{in_samples_ready " << in_samples_ready_depth << "}\n";
  total_list << "{out_mean " << out_mean_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int in_data_depth;
    int in_samples_ready_depth;
    int out_mean_depth;
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
extern "C" void mean_float_hw_stub_wrapper(float, char, volatile void *);

extern "C" void apatb_mean_float_hw(float __xlx_apatb_param_in_data, char __xlx_apatb_param_in_samples_ready, volatile void * __xlx_apatb_param_out_mean) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out_mean);
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
          std::vector<sc_bv<32> > out_mean_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out_mean");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_mean_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((int*)__xlx_apatb_param_out_mean)[0] = out_mean_pc_buffer[0].to_int64();
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
//in_data
aesl_fh.touch(AUTOTB_TVIN_in_data);
aesl_fh.touch(AUTOTB_TVOUT_in_data);
//in_samples_ready
aesl_fh.touch(AUTOTB_TVIN_in_samples_ready);
aesl_fh.touch(AUTOTB_TVOUT_in_samples_ready);
//out_mean
aesl_fh.touch(AUTOTB_TVIN_out_mean);
aesl_fh.touch(AUTOTB_TVOUT_out_mean);
CodeState = DUMP_INPUTS;
// print in_data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_data, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_in_data);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_in_data, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.in_data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_data, __xlx_sprintf_buffer.data());
}
// print in_samples_ready Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_in_samples_ready, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_in_samples_ready);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_in_samples_ready, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.in_samples_ready_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_in_samples_ready, __xlx_sprintf_buffer.data());
}
// print out_mean Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_out_mean, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_out_mean);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_out_mean, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.out_mean_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_out_mean, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
mean_float_hw_stub_wrapper(__xlx_apatb_param_in_data, __xlx_apatb_param_in_samples_ready, __xlx_apatb_param_out_mean);
CodeState = DUMP_OUTPUTS;
// print out_mean Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out_mean, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_out_mean);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_out_mean, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.out_mean_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out_mean, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
