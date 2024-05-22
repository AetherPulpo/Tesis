#ifndef MV_FLOAT
#define MV_FLOAT

#include "ap_int.h"
const int DATA_SIZE = 512;
const float offset = 0.5;
const float VCC = 3.3;
const float G = 1009.0;
const float two_power_n = 1024.0;  // ADC de 10 bits
const float milivolts = 1000.0;

// Función que toma un flujo de datos y retorna otro flujo de datos con valores absolutos
void mv_float(ap_uint<10> in_data, float* out_data);

#endif //  MV_FLOAT
