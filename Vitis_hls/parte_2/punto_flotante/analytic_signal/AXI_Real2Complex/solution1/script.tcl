############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project AXI_Real2Complex
set_top AXI_Real2Complex
add_files AXI_Real2Complex/AXI_Real2Complex.cpp
add_files AXI_Real2Complex/AXI_Real2Complex.h
add_files -tb AXI_Real2Complex/AXI_Real2Complex_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
#source "./AXI_Real2Complex/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
