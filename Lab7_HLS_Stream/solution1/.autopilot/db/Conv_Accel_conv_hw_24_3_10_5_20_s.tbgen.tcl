set moduleName Conv_Accel_conv_hw_24_3_10_5_20_s
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {Conv_Accel_conv_hw<24, 3, 10, 5, 20>}
set C_modelType { void 0 }
set C_modelArgList { 
	{ image_r float 32 regular {array 1728 { 1 3 } 1 1 }  }
	{ filter float 32 regular {array 750 { 1 3 } 1 1 }  }
	{ bias float 32 regular {array 10 { 1 3 } 1 1 }  }
	{ feature_map float 32 regular {array 4000 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "image_r", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "filter", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bias", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "feature_map", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ image_r_address0 sc_out sc_lv 11 signal 0 } 
	{ image_r_ce0 sc_out sc_logic 1 signal 0 } 
	{ image_r_q0 sc_in sc_lv 32 signal 0 } 
	{ filter_address0 sc_out sc_lv 10 signal 1 } 
	{ filter_ce0 sc_out sc_logic 1 signal 1 } 
	{ filter_q0 sc_in sc_lv 32 signal 1 } 
	{ bias_address0 sc_out sc_lv 4 signal 2 } 
	{ bias_ce0 sc_out sc_logic 1 signal 2 } 
	{ bias_q0 sc_in sc_lv 32 signal 2 } 
	{ feature_map_address0 sc_out sc_lv 12 signal 3 } 
	{ feature_map_ce0 sc_out sc_logic 1 signal 3 } 
	{ feature_map_we0 sc_out sc_logic 1 signal 3 } 
	{ feature_map_d0 sc_out sc_lv 32 signal 3 } 
	{ feature_map_q0 sc_in sc_lv 32 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "image_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "image_r", "role": "address0" }} , 
 	{ "name": "image_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "image_r", "role": "ce0" }} , 
 	{ "name": "image_r_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "image_r", "role": "q0" }} , 
 	{ "name": "filter_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "filter", "role": "address0" }} , 
 	{ "name": "filter_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "filter", "role": "ce0" }} , 
 	{ "name": "filter_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "filter", "role": "q0" }} , 
 	{ "name": "bias_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "bias", "role": "address0" }} , 
 	{ "name": "bias_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bias", "role": "ce0" }} , 
 	{ "name": "bias_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bias", "role": "q0" }} , 
 	{ "name": "feature_map_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "feature_map", "role": "address0" }} , 
 	{ "name": "feature_map_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feature_map", "role": "ce0" }} , 
 	{ "name": "feature_map_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "feature_map", "role": "we0" }} , 
 	{ "name": "feature_map_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feature_map", "role": "d0" }} , 
 	{ "name": "feature_map_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "feature_map", "role": "q0" }}  ]}
set Spec2ImplPortList { 
	image_r { ap_memory {  { image_r_address0 mem_address 1 11 }  { image_r_ce0 mem_ce 1 1 }  { image_r_q0 mem_dout 0 32 } } }
	filter { ap_memory {  { filter_address0 mem_address 1 10 }  { filter_ce0 mem_ce 1 1 }  { filter_q0 mem_dout 0 32 } } }
	bias { ap_memory {  { bias_address0 mem_address 1 4 }  { bias_ce0 mem_ce 1 1 }  { bias_q0 mem_dout 0 32 } } }
	feature_map { ap_memory {  { feature_map_address0 mem_address 1 12 }  { feature_map_ce0 mem_ce 1 1 }  { feature_map_we0 mem_we 1 1 }  { feature_map_d0 mem_din 1 32 }  { feature_map_q0 mem_dout 0 32 } } }
}
