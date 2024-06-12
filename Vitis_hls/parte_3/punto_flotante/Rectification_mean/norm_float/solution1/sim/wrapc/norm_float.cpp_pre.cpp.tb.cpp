// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/norm_float/norm_float.cpp"
# 1 "<interno>"
# 1 "<línea-de-órdenes>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<línea-de-órdenes>" 2
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/norm_float/norm_float.cpp"
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/norm_float/norm_float.h" 1
const int DATA_SIZE = 512;


void norm_float(float in_rect_data,
        float in_mean,
    float* out_norm_data);
# 2 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/norm_float/norm_float.cpp" 2


void norm_float(float in_rect_data,
        float in_mean,
    float* out_norm_data){

#pragma HLS interface ap_none port=in_rect_data
#pragma HLS interface ap_none port=in_mean
#pragma HLS interface ap_none port=out_norm_data
#pragma HLS interface ap_ctrl_chain port=return


   float norm_data;


   norm_data = in_rect_data / in_mean;
   *out_norm_data = norm_data;
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_norm_float_ir(float, float, float *);
#ifdef __cplusplus
extern "C"
#endif
void norm_float_hw_stub(float in_rect_data, float in_mean, float *out_norm_data){
norm_float(in_rect_data, in_mean, out_norm_data);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void apatb_norm_float_sw(float in_rect_data, float in_mean, float *out_norm_data){
apatb_norm_float_ir(in_rect_data, in_mean, out_norm_data);
return ;
}
#endif
# 19 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/norm_float/norm_float.cpp"

