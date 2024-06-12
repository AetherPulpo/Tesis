############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_cut_N
set_top axi_cut_N
add_files axi_cut_N/axi_cut_N.cpp
add_files axi_cut_N/axi_cut_N.h
add_files -tb axi_cut_N/axi_cut_N_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
source "./axi_cut_N/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -O -rtl vhdl
export_design -rtl vhdl -format ip_catalog
