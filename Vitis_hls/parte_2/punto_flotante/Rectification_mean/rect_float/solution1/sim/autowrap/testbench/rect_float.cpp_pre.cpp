# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/rect_float/rect_float.cpp"
# 1 "<interno>"
# 1 "<línea-de-órdenes>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<línea-de-órdenes>" 2
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/rect_float/rect_float.cpp"
# 1 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/rect_float/rect_float.h" 1



const int DATA_SIZE = 512;
void rect_float(float in_data,
    float* out_rec_data);
# 2 "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/rect_float/rect_float.cpp" 2


void rect_float(float in_data,
    float* out_rec_data){
#pragma HLS interface ap_none port=in_data
#pragma HLS interface ap_none port=out_rec_data
#pragma HLS interface ap_ctrl_chain port=return


    float absolute_value;


    if(in_data < 0.0){
     absolute_value = -in_data;
    }
    else{
     absolute_value = in_data;
    }

    *out_rec_data = absolute_value;
}
