
/opt/Xilinx/Vivado/2020.2/bin/xelab xil_defaultlib.apatb_AXI_norm_float_top glbl -prj AXI_norm_float.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims  -L unisims_ver -L xpm  -L floating_point_v7_0_18 -L floating_point_v7_1_11 --lib "ieee_proposed=./ieee_proposed" -s AXI_norm_float 
/opt/Xilinx/Vivado/2020.2/bin/xsim --noieeewarnings AXI_norm_float -tclbatch AXI_norm_float.tcl 

