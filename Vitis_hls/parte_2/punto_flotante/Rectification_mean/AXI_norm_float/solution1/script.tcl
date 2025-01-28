############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project AXI_norm_float
set_top AXI_norm_float
add_files AXI_norm_float/AXI_norm_float.cpp
add_files AXI_norm_float/AXI_norm_float.h
add_files -tb AXI_norm_float/AXI_norm_float_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
source "./AXI_norm_float/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
