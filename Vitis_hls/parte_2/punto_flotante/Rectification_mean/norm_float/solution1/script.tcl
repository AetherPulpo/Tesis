############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project norm_float
set_top norm_float
add_files norm_float/norm_float.cpp
add_files norm_float/norm_float.h
add_files -tb norm_float/tb_norm_float.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./norm_float/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
