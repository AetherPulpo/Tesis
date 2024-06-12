############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_polar_translate_v2
set_top axi_polar_translatev2
add_files axi_polar_translate_v2/axi_polar_translate_v2.h
add_files axi_polar_translate_v2/axi_polar_translate_v2.cpp
add_files -tb axi_polar_translate_v2/axi_polar_translate_v2_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
source "./axi_polar_translate_v2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
