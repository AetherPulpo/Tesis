#include "butterworth_double.h"

//Funcion que realiza un filtro butterworth pasabanda
void butterworth_double(hls::stream<float, 1024>& in_amplitude_data,
			 	 	 hls::stream<float, 1024>&  out_iir_data){
#pragma HLS INTERFACE axis port=in_amplitude_data
#pragma HLS INTERFACE axis port=out_iir_data
		float x;
		double y;
		static double y_0 = 0.0;

		//Seccion 1
		static double w00 = 0.0;
		static double w01 = 0.0;
		static double w02 = 0.0;

		//Seccion 2
		static double w10 = 0.0;
		static double w11 = 0.0;
		static double w12 = 0.0;
		loop_stream : for(int j = 0; j < NEW_DATA_SIZE ; j++){
#pragma HLS pipeline II=21
			//Leo la muestra
			x = in_amplitude_data.read();

		    // IIR Seccion 1
			w00= static_cast<double>(x) - (w01*a01) - (w02*a02);
		    y_0 = (b00 * w00) + (b01 * w01) + (b02 * w02);
		    w02 = w01;
		    w01 = w00;

		    // IIR Seccion 2
		    w10= y_0 - (w11 *a11) -(w12 * a12);
		    y = (b10 * w10) + (b11 * w11) + (b12 * w12);
		    w12 = w11;
		    w11 = w10;

		    y_0 = y;
			// Escribo el resultado
			out_iir_data.write(static_cast<float>(y));
		}

}

