############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project butter_double
set_top butterworth_double
add_files butter_double/butter_double.cpp
add_files butter_double/butterworth_double.h
add_files -tb butter_double/butter_double_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
source "./butter_double/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -O -rtl vhdl
export_design -flow impl -rtl vhdl -format ip_catalog
