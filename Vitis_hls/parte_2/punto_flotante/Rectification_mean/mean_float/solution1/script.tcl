############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mean_float
set_top mean_float
add_files mean_float/mean_float.h
add_files mean_float/mean_float.cpp
add_files -tb mean_float/tb_mean_float.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
source "./mean_float/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
