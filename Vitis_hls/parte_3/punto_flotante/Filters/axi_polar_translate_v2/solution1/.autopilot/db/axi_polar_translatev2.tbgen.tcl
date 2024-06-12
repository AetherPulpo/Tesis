set moduleName axi_polar_translatev2
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {axi_polar_translatev2}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_data_V int 64 regular {axi_s 0 volatile  { in_data_V Data } }  }
	{ out_modulus_V int 32 regular {axi_s 1 volatile  { out_modulus_V Data } }  }
	{ out_phase_V int 32 regular {axi_s 1 volatile  { out_phase_V Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in_data.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_modulus_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_modulus.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "out_phase_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out_phase.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_data_V_TDATA sc_in sc_lv 64 signal 0 } 
	{ in_data_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ in_data_V_TREADY sc_out sc_logic 1 inacc 0 } 
	{ out_modulus_V_TDATA sc_out sc_lv 32 signal 1 } 
	{ out_modulus_V_TVALID sc_out sc_logic 1 outvld 1 } 
	{ out_modulus_V_TREADY sc_in sc_logic 1 outacc 1 } 
	{ out_phase_V_TDATA sc_out sc_lv 32 signal 2 } 
	{ out_phase_V_TVALID sc_out sc_logic 1 outvld 2 } 
	{ out_phase_V_TREADY sc_in sc_logic 1 outacc 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_data_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_data_V", "role": "TDATA" }} , 
 	{ "name": "in_data_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_data_V", "role": "TVALID" }} , 
 	{ "name": "in_data_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_data_V", "role": "TREADY" }} , 
 	{ "name": "out_modulus_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_modulus_V", "role": "TDATA" }} , 
 	{ "name": "out_modulus_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_modulus_V", "role": "TVALID" }} , 
 	{ "name": "out_modulus_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_modulus_V", "role": "TREADY" }} , 
 	{ "name": "out_phase_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_phase_V", "role": "TDATA" }} , 
 	{ "name": "out_phase_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_phase_V", "role": "TVALID" }} , 
 	{ "name": "out_phase_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_phase_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "130", "131", "132", "133", "134", "135", "136"],
		"CDFG" : "axi_polar_translatev2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1089", "EstimateLatencyMax" : "1089",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "in_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_data_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_modulus_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_modulus_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_phase_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_phase_V_TDATA_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89", "Parent" : "0", "Child" : ["2", "127", "128", "129"],
		"CDFG" : "atan2_cordic_float_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "62", "EstimateLatencyMin" : "62", "EstimateLatencyMax" : "62",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "y_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_in", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169", "Parent" : "1", "Child" : ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126"],
		"CDFG" : "atan2_generic_float_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "47", "EstimateLatencyMin" : "47", "EstimateLatencyMax" : "47",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "1",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "y_in", "Type" : "None", "Direction" : "I"},
			{"Name" : "x_in", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "3", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_1_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_348", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_4_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_355", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_7_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_362", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_s_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_369", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_12_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_376", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_15_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_383", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_18_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_390", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_21_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_397", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_24_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_404", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_27_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_411", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_30_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_418", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_33_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_425", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_36_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_432", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_39_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_439", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_42_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_446", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_45_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_453", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_48_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_460", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_51_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_467", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_54_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_474", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_57_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_481", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_60_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_488", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_63_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_495", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_66_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_502", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_69_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_509", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_72_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_516", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_75_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_523", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_78_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_530", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_81_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_537", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_84_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_544", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_87_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_551", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_90_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_558", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_93_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_565", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_96_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_572", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_99_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_579", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_102_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_586", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_105_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_593", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_108_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_600", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_111_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_607", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_114_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_614", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_117_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_621", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_119_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s_fu_628", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "44", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_635", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_3_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_642", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_6_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_649", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_9_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_656", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_11_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_663", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_14_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_670", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_17_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_677", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_20_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_684", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_23_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_691", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_26_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_698", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_29_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_705", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_32_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_712", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_35_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_719", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_38_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_726", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_41_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_733", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_44_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_740", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_47_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_747", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "61", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_50_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_754", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "62", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_53_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_761", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_56_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_768", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_59_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_775", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_62_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_782", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_65_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_789", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_68_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_796", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_71_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_803", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_74_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_810", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_77_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_817", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_80_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_824", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_83_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_831", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_86_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_838", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_89_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_845", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_92_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_852", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_95_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_859", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_98_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_866", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_101_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_873", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_104_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_880", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_107_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_887", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_110_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_894", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_113_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_901", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_116_addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s_fu_908", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_2_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_915", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_5_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_924", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_8_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_932", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_10_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_940", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_13_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_948", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_16_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_956", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_19_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_964", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_22_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_972", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_25_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_980", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_28_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_988", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_31_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_996", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_34_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1004", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_37_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1012", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_40_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1020", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_43_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1028", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_46_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1036", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_49_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1044", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_52_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1052", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_55_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1060", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_58_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1068", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_61_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1076", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_64_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1084", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_67_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1092", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_70_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1100", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_73_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1108", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_76_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1116", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_79_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1124", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_82_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1132", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_85_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1140", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_88_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1148", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_91_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1156", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_94_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1164", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_97_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1172", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_100_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1180", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_103_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1188", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_106_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1196", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_109_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1204", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_112_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1212", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_115_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1220", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_118_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1228", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_120_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1236", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.trunc_ln657_121_addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s_fu_1244", "Parent" : "2",
		"CDFG" : "addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "None", "Direction" : "I"},
			{"Name" : "b", "Type" : "None", "Direction" : "I"},
			{"Name" : "add", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.grp_atan2_generic_float_s_fu_169.fdiv_32ns_32ns_32_16_no_dsp_1_U10", "Parent" : "2"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.fsub_32ns_32ns_32_5_full_dsp_0_U14", "Parent" : "1"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.fsub_32ns_32ns_32_5_full_dsp_0_U15", "Parent" : "1"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_atan2_cordic_float_s_fu_89.fcmp_32ns_32ns_1_2_no_dsp_0_U16", "Parent" : "1"},
	{"ID" : "130", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_5_full_dsp_1_U21", "Parent" : "0"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U22", "Parent" : "0"},
	{"ID" : "132", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_4_max_dsp_1_U23", "Parent" : "0"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_16_no_dsp_1_U24", "Parent" : "0"},
	{"ID" : "134", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_data_V_U", "Parent" : "0"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_modulus_V_U", "Parent" : "0"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_phase_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	axi_polar_translatev2 {
		in_data_V {Type I LastRead 1 FirstWrite -1}
		out_modulus_V {Type O LastRead -1 FirstWrite 64}
		out_phase_V {Type O LastRead -1 FirstWrite 64}}
	atan2_cordic_float_s {
		y_in {Type I LastRead 0 FirstWrite -1}
		x_in {Type I LastRead 0 FirstWrite -1}}
	atan2_generic_float_s {
		y_in {Type I LastRead 0 FirstWrite -1}
		x_in {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_bool_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_43_4_5_3_0_ap_fixed_43_4_5_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}
	addsub_0_0_ap_fixed_40_1_5_3_0_ap_fixed_40_1_0_3_0_ap_uint_1_s {
		a {Type I LastRead 0 FirstWrite -1}
		b {Type I LastRead 0 FirstWrite -1}
		add {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1089", "Max" : "1089"}
	, {"Name" : "Interval", "Min" : "1090", "Max" : "1090"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_data_V { axis {  { in_data_V_TDATA in_data 0 64 }  { in_data_V_TVALID in_vld 0 1 }  { in_data_V_TREADY in_acc 1 1 } } }
	out_modulus_V { axis {  { out_modulus_V_TDATA out_data 1 32 }  { out_modulus_V_TVALID out_vld 1 1 }  { out_modulus_V_TREADY out_acc 0 1 } } }
	out_phase_V { axis {  { out_phase_V_TDATA out_data 1 32 }  { out_phase_V_TVALID out_vld 1 1 }  { out_phase_V_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
