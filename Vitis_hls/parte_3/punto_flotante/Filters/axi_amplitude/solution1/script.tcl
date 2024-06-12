############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_amplitude
set_top axi_amplitude
add_files axi_amplitude/axi_amplitude.cpp
add_files axi_amplitude/axi_amplitude.h
add_files -tb axi_amplitude/axi_amplitude_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
source "./axi_amplitude/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
