#include "axi_prediction_v2_5.h"

//Funcion que amplifica la señal, calcula su promedio y le aplica raiz cuadrada
void axi_prediction_v2_5(hls::stream<float, 512>& in_data,
			 hls::stream<float, 1>&  in_amp_data,
			 hls::stream<float, 1>& in_max_data,
			 //hls::stream<float, 512>& out_tremor_data,
			 //hls::stream<axi_stream> & out_current_tremor,
			 hls::stream<axi_stream>& out_predict_tremor){
#pragma HLS INTERFACE axis port=in_data
#pragma HLS INTERFACE axis port=in_amp_data
#pragma HLS INTERFACE axis port=in_max_data
//#pragma HLS INTERFACE axis port=out_tremor_data
//#pragma HLS INTERFACE axis port=out_current_tremor
#pragma HLS INTERFACE axis port=out_predict_tremor
		//Declaro variables
	    axi_stream axi_tmp_notremor;
	    axi_stream axi_tmp_ctremor;
	    axi_stream axi_tmp_ptremor;
		float tmp;
		float tmp_amp;
		float tmp_max;
		float threshold = 0.25;
		float condition;
		static int burst_cnt = 0;
		static int next_burst_cnt = 0;
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

		Loop_stream_diagnosis : for( int i = 0; i < DATA_SIZE; i++){
			 tmp = in_data.read();
			 tremor[i] = tmp;
			// out_tremor_data.write(tmp);
		}

		tmp_amp = in_amp_data.read();
		tmp_max = in_max_data.read();
		condition = tmp_max *0.05;
		if (tmp_amp < threshold){
			axi_tmp_notremor.data = 0;
			axi_tmp_notremor.last = 1;
			out_predict_tremor.write(axi_tmp_notremor);
			//out_current_tremor.write(axi_tmp_notremor);
		}
		else{

			loop_ibi : for (int t = 1; t < (DATA_SIZE-1) ; t++){
				if ( (tremor[t-1] <= tremor[t]) && (tremor[t] > tremor[t + 1]) && (tremor[t] > condition) ){
					burst_cnt +=  1;
					burst_index[burst_cnt - 1] = t;

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

		   //Calcula time for next_bursts
		   loop_final: for( int i  = 1; (time_next_burst[i - 1] + mean_ibi < 1024.0); i++ ){
		   #pragma HLS pipeline II=32
			   time_next_burst[i] = static_cast<int>(hls::roundf(static_cast<float>(time_next_burst[0]) + (mean_ibi * i)));
			   next_burst_cnt =  next_burst_cnt + 1 ;
		   }

		  // loop_escritura_ctremor : for (int i = 0; i < burst_cnt; i++){
		//	   axi_tmp_ctremor.data = burst_index[i];
			//   if(i == burst_cnt-1 ){
			 //   axi_tmp_ctremor.last = 1;
			  // }
			   //else{
			//	   axi_tmp_ctremor.last = 0;
			//   }
			//   out_current_tremor.write(axi_tmp_ctremor);
		 //  }

		   loop_escritura_ptremor : for (int i = 0; i < next_burst_cnt+1; i++){
		   #pragma HLS loop_tripcount min=1 max=512
			   axi_tmp_ptremor.data = time_next_burst[i];
			   if(i == next_burst_cnt){
				   axi_tmp_ptremor.last = 1;
			   }
			   else{
				   axi_tmp_ptremor.last = 0;
			   }
			   out_predict_tremor.write(axi_tmp_ptremor);
		   }
		}//Fin del else

		//Se vuelve a iniciar las variables estaticas
		next_burst_cnt = 0;
		axi_tmp_notremor.last = 0;
		axi_tmp_ptremor.last = 0;
		axi_tmp_ctremor.last = 0;
		counter = 0;
		tmp_b = 0.0;
		sum_weight = 0.0;
		sum_weight_ibi = 0.0;
		burst_cnt = 0;
		tmp_max = 0.0;
}
