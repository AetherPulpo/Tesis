
/opt/Xilinx/Vivado/2020.2/bin/xelab xil_defaultlib.apatb_rect_float_top glbl -prj rect_float.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims  -L unisims_ver -L xpm  -L floating_point_v7_0_18 -L floating_point_v7_1_11 --lib "ieee_proposed=./ieee_proposed" -s rect_float 
/opt/Xilinx/Vivado/2020.2/bin/xsim --noieeewarnings rect_float -tclbatch rect_float.tcl 

