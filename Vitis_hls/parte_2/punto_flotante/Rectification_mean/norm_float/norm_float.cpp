#include "norm_float.h"
//-----------------------------------------//
//Funcion que obtiene el promedio de la senal
void norm_float(float  in_rect_data,
		  	  	float  in_mean,
				float*  out_norm_data){

#pragma HLS interface ap_none port=in_rect_data
#pragma HLS interface ap_none port=in_mean
#pragma HLS interface ap_none port=out_norm_data
#pragma HLS interface ap_ctrl_chain port=return

   // Se declaran variables
   float norm_data;
   //Se obtiene la muestra normalizada a partir
   // de las muestras rectificadas y el promedio de éstas
   norm_data = in_rect_data / in_mean;
   *out_norm_data = norm_data;
}
//-----------------------------------------//
