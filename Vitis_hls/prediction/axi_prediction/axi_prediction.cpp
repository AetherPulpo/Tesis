#include "axi_prediction.h"

//Funcion que amplifica la señal, calcula su promedio y le aplica raiz cuadrada
void axi_prediction(hls::stream<float, 512>& in_data,
			 hls::stream<float, 1>&  in_amp_data,
			 hls::stream<float, 1>& in_max_data,
			 hls::stream<int> & out_current_tremor,
			 hls::stream<int>& out_predict_tremor){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=in_amp_data
#pragma HLS INTERFACE axis port=in_max_data
#pragma HLS INTERFACE axis port=out_current_tremor
#pragma HLS INTERFACE axis port=out_predict_tremor
		//Declaro variables
		float tmp;
		float tmp_amp;
		float tmp_max;
		float threshold = 0.25;
		float condition;
		static int burst_cnt = 0;
		float result;
		float tremor[DATA_SIZE];
		int burst_index[MEM_SIZE];
		int ibi[MEM_SIZE];
		float weight[DATA_SIZE];
		static int counter = 0;
		float sum_weight = 0.0;
		float sum_weight_ibi = 0.0;
		float mean_ibi;
		int time_next_burst [MEM_SIZE];
		float prediction_temp[MEM_SIZE];
		static float tmp_b = 0.0;

		tmp_amp = in_amp_data.read();
		tmp_max = in_max_data.read();
		condition = tmp_max *0.05;
		if (tmp_amp < threshold){
			out_predict_tremor.write(0);
			out_current_tremor.write(0);
			for( int i = 0; i < DATA_SIZE; i++){
			 tmp = in_data.read();
			}
			return;
		}
		else{
			loop_stream_diagnosis : for(int j = 0; j < DATA_SIZE ; j++){
				//Leo la muestra
				tmp = in_data.read();
				//se almacena en un arreglo
				tremor[j] = tmp;
			}
			loop_ibi : for (int t = 1; t < (DATA_SIZE-1) ; t++){
				if ( (tremor[t-1] <= tremor[t]) && (tremor[t] > tremor[t + 1]) && (tremor[t] > condition) ){
					burst_cnt +=  1;
					burst_index[burst_cnt - 1] = t;
					out_current_tremor.write(t);
					if (burst_cnt > 1){
						ibi[burst_cnt - 2] = burst_index[burst_cnt - 1] - burst_index[burst_cnt - 2];
					}
				}
			}
			// CALCULAR MEAN IBI
			// Asignar memoria dinámica para el array de salida
//			float *weight = (float *)malloc(burst_cnt * sizeof(float));
		    // Calcular el incremento
			// float step = (end - start) / (num - 1);
			//como end es burts_cnt/2 + 1  ; start es 1 y num es burst_cnt:
		    float step = ((static_cast<float>(burst_cnt)) / (2.0*(static_cast<float>(burst_cnt) - 1.0)));
		    // Generar los puntos
		    loop_weight : for (int i = 0; i < burst_cnt; i++) {
			#pragma HLS pipeline II=6
		        weight[i] = 1 + (i * step);
		        if (i < (burst_cnt-1)){
		        	float tmp_weight = weight[i] * ibi[i];
		        	sum_weight_ibi = sum_weight_ibi + tmp_weight;
		        	sum_weight = sum_weight + weight[i];
		        }
		    }
		    mean_ibi = sum_weight_ibi / sum_weight;

		    // calcular time_for_next_bursts[0]
		   //float prediction_temp[burst_cnt]; //lo inicialicé al inicio
		   time_next_burst[0] = 0;
		   sum_weight = sum_weight + weight[burst_cnt-1];
		   loop_tnb: while (time_next_burst[0] <= DATA_SIZE){
			   counter = counter + 1;

			   loop_tmp_b: for(int t = 0; t < burst_cnt; t++){
			   #pragma HLS pipeline II=5
				   prediction_temp[t] = static_cast<float>(burst_index[t]) + ( mean_ibi * static_cast<float>(burst_cnt - t + counter));
				   tmp_b = tmp_b + (weight[t] * prediction_temp[t]);
			   }
			   //Tengo que buscarle la vuelta

			   time_next_burst[0] = static_cast<int>(hls::roundf(tmp_b/sum_weight));
		   }

		   out_predict_tremor.write(time_next_burst[0]);
		   //Calcula time for next_bursts
		   loop_final: for( int i  = 1; (time_next_burst[i - 1] + mean_ibi < 1024.0); i++ ){
		   #pragma HLS pipeline II=32
//		   while (time_next_burst[counter - 1] + mean_ibi < 1024.0){
			   time_next_burst[i] = static_cast<int>(hls::roundf(static_cast<float>(time_next_burst[0]) + (mean_ibi * i)));
			   out_predict_tremor.write(time_next_burst[i]);
		   }

		}//Fin del else

		//Se vuelve a iniciar las variables estaticas
		counter = 0;
		tmp_b = 0.0;
		sum_weight = 0.0;
		sum_weight_ibi = 0.0;
		burst_cnt = 0;
		tmp_max = 0.0;
}
