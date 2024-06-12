############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_N_zeroes
set_top axi_N_zeroes
add_files axi_N_zeroes/axi_N_zeroes.cpp
add_files axi_N_zeroes/axi_N_zeroes.h
add_files -tb axi_N_zeroes/axi_N_zeroes_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./axi_N_zeroes/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
