############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_butterworth
set_top axi_butterworth
add_files axi_butterworth/axi_butterworth.cpp
add_files axi_butterworth/axi_butterworth.h
add_files -tb axi_butterworth/axi_butterworth_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
source "./axi_butterworth/solution1/directives.tcl"
csim_design -O
csynth_design
cosim_design -rtl vhdl
export_design -flow impl -rtl vhdl -format ip_catalog
