############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project axi_polar_translate
set_top axi_polar_translate
add_files axi_polar_translate/axi_polar_translate.cpp
add_files axi_polar_translate/axi_polar_translate.h
add_files -tb axi_polar_translate/axi_polar_translate_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./axi_polar_translate/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -format ip_catalog
