// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/mean_float/mean_float.cpp"
# 1 "<interno>"
# 1 "<línea-de-órdenes>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<línea-de-órdenes>" 2
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/mean_float/mean_float.cpp"
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/mean_float/mean_float.h" 1

const int DATA_SIZE = 512;



void mean_float(float in_data,
    bool in_samples_ready,
    float* out_mean);
# 2 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/mean_float/mean_float.cpp" 2




void mean_float(float in_data,
          bool in_samples_ready,
    float* out_mean){

#pragma HLS interface ap_none port=in_data
#pragma HLS interface ap_none port=in_samples_ready
#pragma HLS interface ap_none port=out_mean
#pragma HLS interface ap_ctrl_chain port=return


    static float sum{0.0};
    float average;
    float mean_done = false;


    sum = sum + in_data;


    if (in_samples_ready == true){
     average = sum / static_cast<float>(DATA_SIZE);
    }
    else{
     average = 0;
    }
    *out_mean = average;
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_mean_float_ir(float, bool, float *);
#ifdef __cplusplus
extern "C"
#endif
void mean_float_hw_stub(float in_data, bool in_samples_ready, float *out_mean){
mean_float(in_data, in_samples_ready, out_mean);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void apatb_mean_float_sw(float in_data, bool in_samples_ready, float *out_mean){
apatb_mean_float_ir(in_data, in_samples_ready, out_mean);
return ;
}
#endif
# 31 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/mean_float/mean_float.cpp"

