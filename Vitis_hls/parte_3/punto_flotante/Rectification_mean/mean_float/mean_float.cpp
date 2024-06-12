#include "mean_float.h"
//-----------------------------------------//


//Funcion que realiza el promedio de las muestras
void mean_float(float   	in_data,
		        bool		in_samples_ready,
				float*  	out_mean){
//declaro los pragma
#pragma HLS interface ap_none port=in_data
#pragma HLS interface ap_none port=in_samples_ready
#pragma HLS interface ap_none port=out_mean
#pragma HLS interface ap_ctrl_chain port=return

    //declaro variables
    static float sum{0.0};
    float average;
    float mean_done = false;

    //Suma todos los valores rectificados
    sum = sum + in_data;

    //Una vez sumadas las N muestras rectificadas, se lo divide por la cantidad total de muestras
    if (in_samples_ready == true){
    	average = sum / static_cast<float>(DATA_SIZE);
    }
    else{
    	average = 0;
    }
    *out_mean = average;
}
//-----------------------------------------//
