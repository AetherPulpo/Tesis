create_project prj -part xc7z020-clg400-1 -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/rect_float/solution1/syn/vhdl/rect_float_ap_fcmp_0_no_dsp_32_ip.tcl"
