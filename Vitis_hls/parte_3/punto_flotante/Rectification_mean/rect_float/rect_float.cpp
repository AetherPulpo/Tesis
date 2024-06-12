#include "rect_float.h"
//-----------------------------------------//
//Funcion que realiza la rectificacion de la senal
void rect_float(float   in_data,
				float*  out_rec_data){
#pragma HLS interface ap_none port=in_data
#pragma HLS interface ap_none port=out_rec_data
#pragma HLS interface ap_ctrl_chain port=return

    //declaro variables
    float absolute_value;

    // Calcula el valor absoluto (rectificacion)
    if(in_data < 0.0){
    	absolute_value = -in_data;
    }
    else{
    	absolute_value = in_data;
    }
    //Se obtiene a la salida el valor rectificado
    *out_rec_data = absolute_value;
}
//-----------------------------------------//
