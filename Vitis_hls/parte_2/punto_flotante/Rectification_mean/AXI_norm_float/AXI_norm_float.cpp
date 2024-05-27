#include "AXI_norm_float.h"
//-----------------------------------------//
//Funcion que obtiene el promedio de la senal
void AXI_norm_float(volatile float  in_rect_data[512],
		  	  	float  in_mean,
				hls::stream<float>& out_norm_data){

#pragma HLS interface ap_fifo port=in_rect_data
#pragma HLS interface ap_none port=in_mean
#pragma HLS interface axis port=out_norm_data


   // Se declaran variables
   static int counter = 0;
   float tmp;
   float norm_data;

	loop: do{
#pragma HLS PIPELINE II=1

		//Leo la muestra
		tmp = in_rect_data[counter];

		//Se obtiene la muestra normalizada a partir
		// de las muestras rectificadas y el promedio de éstas
		norm_data = tmp / in_mean;

		// Escribo el resultado
		out_norm_data.write(norm_data);

		counter++;
	}while (counter < DATA_SIZE);
	counter = 0;
}
//-----------------------------------------//
