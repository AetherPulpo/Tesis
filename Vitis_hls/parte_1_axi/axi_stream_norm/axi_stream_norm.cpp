#include "axi_stream_norm.h"
//-----------------------------------------//
//Funcion que normaliza las muestras
void axi_stream_norm(hls::stream<float, 512>& in_rect_data,
		  	  	hls::stream<float, 1> &  in_mean_data,
				hls::stream<float, 512>& out_norm_data){

#pragma HLS interface axis port=in_rect_data
#pragma HLS interface axis port=in_mean_data
#pragma HLS interface axis port=out_norm_data


	//declaro variables
	    float tmp_rect;
	    float tmp_mean;
	    float result;
	    float rect[DATA_SIZE];

	    read_stream:for(int i = 0; i < DATA_SIZE; i++){
	    	//Leo el valor
	    	rect[i] = in_rect_data.read();
	    }
	    //Leo el valor del promedio
	    tmp_mean = in_mean_data.read();

	    loop_stream : for (int i = 0; i < DATA_SIZE; i ++){
	    	result = rect[i]/tmp_mean;

	    	//Se obtiene la muestra normalizada a partir
	    	// de las muestras rectificadas y el promedio de éstas
	    	out_norm_data.write(result);

	    }
	}
//-----------------------------------------//
