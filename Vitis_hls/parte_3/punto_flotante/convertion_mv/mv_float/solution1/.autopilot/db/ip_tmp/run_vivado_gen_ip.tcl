create_project prj -part xc7z020-clg400-1 -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/convertion_mv/mv_float/solution1/syn/vhdl/mv_float_ap_uitofp_4_no_dsp_32_ip.tcl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/convertion_mv/mv_float/solution1/syn/vhdl/mv_float_ap_fdiv_14_no_dsp_32_ip.tcl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/convertion_mv/mv_float/solution1/syn/vhdl/mv_float_ap_fadd_3_full_dsp_32_ip.tcl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/convertion_mv/mv_float/solution1/syn/vhdl/mv_float_ap_fmul_2_max_dsp_32_ip.tcl"
