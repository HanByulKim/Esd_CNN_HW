set moduleName Conv_Accel_wrapped_conv_hw
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {Conv_Accel_wrapped_conv_hw}
set C_modelType { void 0 }
set C_modelArgList { 
	{ in_stream_data_V int 32 regular {axi_s 0 volatile  { INPUT_STREAM data } }  }
	{ in_stream_keep_V int 4 regular {axi_s 0 volatile  { INPUT_STREAM keep } }  }
	{ in_stream_strb_V int 4 regular {axi_s 0 volatile  { INPUT_STREAM strb } }  }
	{ in_stream_user_V int 4 regular {axi_s 0 volatile  { INPUT_STREAM user } }  }
	{ in_stream_last_V int 1 regular {axi_s 0 volatile  { INPUT_STREAM last } }  }
	{ in_stream_id_V int 5 regular {axi_s 0 volatile  { INPUT_STREAM id } }  }
	{ in_stream_dest_V int 5 regular {axi_s 0 volatile  { INPUT_STREAM dest } }  }
	{ out_stream_data_V int 32 regular {axi_s 1 volatile  { OUTPUT_STREAM data } }  }
	{ out_stream_keep_V int 4 regular {axi_s 1 volatile  { OUTPUT_STREAM keep } }  }
	{ out_stream_strb_V int 4 regular {axi_s 1 volatile  { OUTPUT_STREAM strb } }  }
	{ out_stream_user_V int 4 regular {axi_s 1 volatile  { OUTPUT_STREAM user } }  }
	{ out_stream_last_V int 1 regular {axi_s 1 volatile  { OUTPUT_STREAM last } }  }
	{ out_stream_id_V int 5 regular {axi_s 1 volatile  { OUTPUT_STREAM id } }  }
	{ out_stream_dest_V int 5 regular {axi_s 1 volatile  { OUTPUT_STREAM dest } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_stream_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_user_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_id_V", "interface" : "axis", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_dest_V", "interface" : "axis", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "out_stream_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_user_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_id_V", "interface" : "axis", "bitwidth" : 5, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_dest_V", "interface" : "axis", "bitwidth" : 5, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ INPUT_STREAM_TDATA sc_in sc_lv 32 signal 0 } 
	{ INPUT_STREAM_TVALID sc_in sc_logic 1 invld 0 } 
	{ INPUT_STREAM_TREADY sc_out sc_logic 1 inacc 6 } 
	{ INPUT_STREAM_TKEEP sc_in sc_lv 4 signal 1 } 
	{ INPUT_STREAM_TSTRB sc_in sc_lv 4 signal 2 } 
	{ INPUT_STREAM_TUSER sc_in sc_lv 4 signal 3 } 
	{ INPUT_STREAM_TLAST sc_in sc_lv 1 signal 4 } 
	{ INPUT_STREAM_TID sc_in sc_lv 5 signal 5 } 
	{ INPUT_STREAM_TDEST sc_in sc_lv 5 signal 6 } 
	{ OUTPUT_STREAM_TDATA sc_out sc_lv 32 signal 7 } 
	{ OUTPUT_STREAM_TVALID sc_out sc_logic 1 outvld 13 } 
	{ OUTPUT_STREAM_TREADY sc_in sc_logic 1 outacc 13 } 
	{ OUTPUT_STREAM_TKEEP sc_out sc_lv 4 signal 8 } 
	{ OUTPUT_STREAM_TSTRB sc_out sc_lv 4 signal 9 } 
	{ OUTPUT_STREAM_TUSER sc_out sc_lv 4 signal 10 } 
	{ OUTPUT_STREAM_TLAST sc_out sc_lv 1 signal 11 } 
	{ OUTPUT_STREAM_TID sc_out sc_lv 5 signal 12 } 
	{ OUTPUT_STREAM_TDEST sc_out sc_lv 5 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "INPUT_STREAM_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_stream_data_V", "role": "A" }} , 
 	{ "name": "INPUT_STREAM_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_stream_data_V", "role": "ID" }} , 
 	{ "name": "INPUT_STREAM_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_stream_dest_V", "role": "DY" }} , 
 	{ "name": "INPUT_STREAM_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_keep_V", "role": "P" }} , 
 	{ "name": "INPUT_STREAM_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_strb_V", "role": "B" }} , 
 	{ "name": "INPUT_STREAM_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_user_V", "role": "R" }} , 
 	{ "name": "INPUT_STREAM_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_last_V", "role": "T" }} , 
 	{ "name": "INPUT_STREAM_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "in_stream_id_V", "role": "D" }} , 
 	{ "name": "INPUT_STREAM_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "in_stream_dest_V", "role": "T" }} , 
 	{ "name": "OUTPUT_STREAM_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_stream_data_V", "role": "A" }} , 
 	{ "name": "OUTPUT_STREAM_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream_dest_V", "role": "ID" }} , 
 	{ "name": "OUTPUT_STREAM_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream_dest_V", "role": "DY" }} , 
 	{ "name": "OUTPUT_STREAM_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_keep_V", "role": "P" }} , 
 	{ "name": "OUTPUT_STREAM_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_strb_V", "role": "B" }} , 
 	{ "name": "OUTPUT_STREAM_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_user_V", "role": "R" }} , 
 	{ "name": "OUTPUT_STREAM_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_last_V", "role": "T" }} , 
 	{ "name": "OUTPUT_STREAM_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "out_stream_id_V", "role": "D" }} , 
 	{ "name": "OUTPUT_STREAM_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "out_stream_dest_V", "role": "T" }}  ]}
set Spec2ImplPortList { 
	in_stream_data_V { axis {  { INPUT_STREAM_TDATA in_data 0 32 }  { INPUT_STREAM_TVALID in_vld 0 1 } } }
	in_stream_keep_V { axis {  { INPUT_STREAM_TKEEP in_data 0 4 } } }
	in_stream_strb_V { axis {  { INPUT_STREAM_TSTRB in_data 0 4 } } }
	in_stream_user_V { axis {  { INPUT_STREAM_TUSER in_data 0 4 } } }
	in_stream_last_V { axis {  { INPUT_STREAM_TLAST in_data 0 1 } } }
	in_stream_id_V { axis {  { INPUT_STREAM_TID in_data 0 5 } } }
	in_stream_dest_V { axis {  { INPUT_STREAM_TREADY in_acc 1 1 }  { INPUT_STREAM_TDEST in_data 0 5 } } }
	out_stream_data_V { axis {  { OUTPUT_STREAM_TDATA out_data 1 32 } } }
	out_stream_keep_V { axis {  { OUTPUT_STREAM_TKEEP out_data 1 4 } } }
	out_stream_strb_V { axis {  { OUTPUT_STREAM_TSTRB out_data 1 4 } } }
	out_stream_user_V { axis {  { OUTPUT_STREAM_TUSER out_data 1 4 } } }
	out_stream_last_V { axis {  { OUTPUT_STREAM_TLAST out_data 1 1 } } }
	out_stream_id_V { axis {  { OUTPUT_STREAM_TID out_data 1 5 } } }
	out_stream_dest_V { axis {  { OUTPUT_STREAM_TVALID out_vld 1 1 }  { OUTPUT_STREAM_TREADY out_acc 0 1 }  { OUTPUT_STREAM_TDEST out_data 1 5 } } }
}
