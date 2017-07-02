############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project Lab7_HLS_Stream
set_top Conv_Accel
add_files ../hw2hlsstream/bias.h
add_files ../hw2hlsstream/conv.hpp
add_files ../hw2hlsstream/conv_accel.cpp
add_files ../hw2hlsstream/input_image.h
add_files ../hw2hlsstream/output.h
add_files ../hw2hlsstream/weight.h
add_files -tb ../hw2hlsstream/conv_test.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./Lab7_HLS_Stream/solution1/directives.tcl"
csim_design -clean -setup
csynth_design
cosim_design -trace_level all -tool modelsim
export_design -format ip_catalog
