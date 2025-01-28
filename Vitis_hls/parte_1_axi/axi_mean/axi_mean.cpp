#include "axi_mean.h"
//-----------------------------------------//
//Funcion que realiza el rectificado y el promedio de las muestras para su posterior normalizacion
void axi_mean(hls::stream<float,512>& in_mv_data, hls::stream<float,512>& out_rect_data, hls::stream<float, 1>& out_mean_data) {
#pragma HLS INTERFACE axis port=in_mv_data
#pragma HLS INTERFACE axis port=out_mean_data
#pragma HLS INTERFACE axis port=out_rect_data

    //declaro variables
    float average;
    float tmp;
    float rect;
    static float sum = 0.0;
    static int counter = 0;
    loop_stream: do{
		//Leo el valor
		tmp = in_mv_data.read();
		//Apĺico valor absoluto a la muestra (rectificacion)
		//rect = hls::fabsf(tmp);
		if (tmp < 0.0){
			rect = -tmp;
		}
		else{
			rect = tmp;
		}
		//Se obtiene a la salida el valor rectificado
		out_rect_data.write(rect);
		sum = sum + rect;
		counter = counter + 1;
	}while (counter < DATA_SIZE);

    //Una vez sumadas las N muestras rectificadas, se lo divide por la cantidad total de muestras
        average = sum / static_cast<float>(DATA_SIZE);
        out_mean_data.write(average);
        sum = 0.0;
        counter = 0;
/*    loop_stream:for(int i = 0; i < DATA_SIZE; i++){
    	//Leo el valor
    	tmp = in_mv_data.read();
    	//Apĺico valor absoluto a la muestra (rectificacion)
    	//    	rect = hls::fabsf(tmp);
    	if (tmp < 0.0){
    		rect = -tmp;
    	}
    	else{
    		rect = tmp;
    	}
    	sum = sum + rect;
    	//Se obtiene a la salida el valor rectificado
        out_rect_data.write(rect);
    }
    //Una vez sumadas las N muestras rectificadas, se lo divide por la cantidad total de muestras
    average = sum / static_cast<float>(DATA_SIZE);
    out_mean_data.write(average);
    sum = 0.0; */
}
//-----------------------------------------//
