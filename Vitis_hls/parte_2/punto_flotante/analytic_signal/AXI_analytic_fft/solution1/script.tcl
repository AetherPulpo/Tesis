############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project AXI_analytic_fft
set_top axi_analytic_fft
add_files AXI_analytic_fft/AXI_analytic_fft.h
add_files AXI_analytic_fft/AXI_analytic_fft_v2.cpp
add_files -tb AXI_analytic_fft/AXI_analytic_fft_tb_2.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl vhdl
source "./AXI_analytic_fft/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl
export_design -rtl vhdl -format ip_catalog
