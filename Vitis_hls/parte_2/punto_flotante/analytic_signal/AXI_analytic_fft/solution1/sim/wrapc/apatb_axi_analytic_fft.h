// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_axi_analytic_fft (
hls::stream<int > in_data,
hls::stream<int > out_data,
volatile void* TLAST);
