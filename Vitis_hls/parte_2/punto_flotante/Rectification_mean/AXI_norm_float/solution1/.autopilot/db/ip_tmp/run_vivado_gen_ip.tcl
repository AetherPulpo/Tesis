create_project prj -part xc7z020-clg400-1 -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/usuario/Escritorio/Tesis/IP_V3/punto_flotante/Rectification_mean/AXI_norm_float/solution1/syn/vhdl/AXI_norm_float_ap_fdiv_14_no_dsp_32_ip.tcl"
