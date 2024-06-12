// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Jun 10 10:24:42 2024
// Host        : vitis-VBox running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/butter_double/solution1/impl/vhdl/project.gen/sources_1/bd/bd_0/ip/bd_0_hls_inst_0/bd_0_hls_inst_0_stub.v
// Design      : bd_0_hls_inst_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "butterworth_double,Vivado 2020.2" *)
module bd_0_hls_inst_0(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, in_amplitude_data_V_TVALID, in_amplitude_data_V_TREADY, 
  in_amplitude_data_V_TDATA, out_iir_data_V_TVALID, out_iir_data_V_TREADY, 
  out_iir_data_V_TDATA)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,in_amplitude_data_V_TVALID,in_amplitude_data_V_TREADY,in_amplitude_data_V_TDATA[31:0],out_iir_data_V_TVALID,out_iir_data_V_TREADY,out_iir_data_V_TDATA[31:0]" */;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input in_amplitude_data_V_TVALID;
  output in_amplitude_data_V_TREADY;
  input [31:0]in_amplitude_data_V_TDATA;
  output out_iir_data_V_TVALID;
  input out_iir_data_V_TREADY;
  output [31:0]out_iir_data_V_TDATA;
endmodule
