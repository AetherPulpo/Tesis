create_project prj -part xc7z020-clg400-1 -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/butter_double/solution1/syn/vhdl/butterworth_double_ap_dadddsub_5_full_dsp_64_ip.tcl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/butter_double/solution1/syn/vhdl/butterworth_double_ap_dmul_5_max_dsp_64_ip.tcl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/butter_double/solution1/syn/vhdl/butterworth_double_ap_fpext_0_no_dsp_32_ip.tcl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Filters/butter_double/solution1/syn/vhdl/butterworth_double_ap_fptrunc_0_no_dsp_64_ip.tcl"
