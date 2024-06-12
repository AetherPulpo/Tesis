############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project complex_concatenate
set_top complex_concatenate
add_files complex_concatenate/complex_concatenate.cpp
add_files complex_concatenate/complex_concatenate.h
add_files -tb complex_concatenate/complex_concatenate_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./complex_concatenate/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -format ip_catalog
