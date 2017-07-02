; ModuleID = 'C:/Users/user/Desktop/convhw/Lab7_HLS_Stream/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@Conv_Accel_str = internal unnamed_addr constant [11 x i8] c"Conv_Accel\00"
@p_str7 = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1
@p_str6 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1
@p_str5 = private unnamed_addr constant [12 x i8] c"hls_label_2\00", align 1
@p_str4 = private unnamed_addr constant [12 x i8] c"hls_label_3\00", align 1
@p_str3 = private unnamed_addr constant [5 x i8] c"axis\00", align 1
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str1 = private unnamed_addr constant [12 x i8] c"CONTROL_BUS\00", align 1
@p_str = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1

define internal fastcc void @Conv_Accel_wrapped_conv_hw(i32* %in_stream_data_V, i4* %in_stream_keep_V, i4* %in_stream_strb_V, i4* %in_stream_user_V, i1* %in_stream_last_V, i5* %in_stream_id_V, i5* %in_stream_dest_V, i32* %out_stream_data_V, i4* %out_stream_keep_V, i4* %out_stream_strb_V, i4* %out_stream_user_V, i1* %out_stream_last_V, i5* %out_stream_id_V, i5* %out_stream_dest_V) {
  call void (...)* @_ssdm_op_SpecInterface(i32* %in_stream_data_V, i4* %in_stream_keep_V, i4* %in_stream_strb_V, i4* %in_stream_user_V, i1* %in_stream_last_V, i5* %in_stream_id_V, i5* %in_stream_dest_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  call void (...)* @_ssdm_op_SpecInterface(i32* %out_stream_data_V, i4* %out_stream_keep_V, i4* %out_stream_strb_V, i4* %out_stream_user_V, i1* %out_stream_last_V, i5* %out_stream_id_V, i5* %out_stream_dest_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  %image = alloca [1728 x float], align 4
  %filter = alloca [750 x float], align 4
  %bias = alloca [10 x float], align 16
  %feature_map = alloca [4000 x float], align 4
  br label %.preheader17

.preheader17:                                     ; preds = %0, %.preheader18.preheader
  %indvar_flatten1 = phi i11 [ 0, %0 ], [ %indvar_flatten_next1, %.preheader18.preheader ]
  %ch = phi i2 [ 0, %0 ], [ %ch_mid2, %.preheader18.preheader ]
  %indvar_flatten = phi i10 [ 0, %0 ], [ %indvar_flatten_next, %.preheader18.preheader ]
  %i = phi i5 [ 0, %0 ], [ %i_mid2, %.preheader18.preheader ]
  %j = phi i5 [ 0, %0 ], [ %j_1, %.preheader18.preheader ]
  %exitcond_flatten1 = icmp eq i11 %indvar_flatten1, -320
  %indvar_flatten_next1 = add i11 %indvar_flatten1, 1
  br i1 %exitcond_flatten1, label %.preheader13, label %.preheader18.preheader

.preheader18.preheader:                           ; preds = %.preheader17
  %ch_1 = add i2 1, %ch
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1728, i64 1728, i64 1728)
  %exitcond_flatten = icmp eq i10 %indvar_flatten, -448
  %i_mid = select i1 %exitcond_flatten, i5 0, i5 %i
  %not_exitcond_flatten = xor i1 %exitcond_flatten, true
  %exitcond = icmp eq i5 %j, -8
  %exitcond8_mid = and i1 %exitcond, %not_exitcond_flatten
  %ch_mid2 = select i1 %exitcond_flatten, i2 %ch_1, i2 %ch
  %tmp_1 = call i7 @_ssdm_op_BitConcatenate.i7.i2.i5(i2 %ch_mid2, i5 0)
  %p_shl1_cast = zext i7 %tmp_1 to i8
  %tmp_8 = call i5 @_ssdm_op_BitConcatenate.i5.i2.i3(i2 %ch_mid2, i3 0)
  %p_shl2_cast = zext i5 %tmp_8 to i8
  %tmp_3 = sub i8 %p_shl1_cast, %p_shl2_cast
  %tmp_17_cast = sext i8 %tmp_3 to i9
  %i_1 = add i5 1, %i_mid
  %tmp_5 = or i1 %exitcond8_mid, %exitcond_flatten
  %j_mid2 = select i1 %tmp_5, i5 0, i5 %j
  %i_mid2 = select i1 %exitcond8_mid, i5 %i_1, i5 %i_mid
  %tmp_6_cast = zext i5 %i_mid2 to i9
  %tmp_6 = add i9 %tmp_6_cast, %tmp_17_cast
  %tmp_9 = trunc i9 %tmp_6 to i7
  %p_shl_cast = call i12 @_ssdm_op_BitConcatenate.i12.i7.i5(i7 %tmp_9, i5 0)
  %p_shl3_cast = call i12 @_ssdm_op_BitConcatenate.i12.i9.i3(i9 %tmp_6, i3 0)
  %tmp_11 = sub i12 %p_shl_cast, %p_shl3_cast
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str4)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_3 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %in_stream_data_V, i4* %in_stream_keep_V, i4* %in_stream_strb_V, i4* %in_stream_user_V, i1* %in_stream_last_V, i5* %in_stream_id_V, i5* %in_stream_dest_V)
  %in_stream_data_V_val = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_3, 0
  %ret_1 = bitcast i32 %in_stream_data_V_val to float
  %tmp_5_cast = zext i5 %j_mid2 to i12
  %tmp_13 = add i12 %tmp_5_cast, %tmp_11
  %tmp_23_cast = zext i12 %tmp_13 to i64
  %image_addr = getelementptr [1728 x float]* %image, i64 0, i64 %tmp_23_cast
  store float %ret_1, float* %image_addr, align 4
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str4, i32 %tmp_4)
  %j_1 = add i5 1, %j_mid2
  %indvar_flatten_op = add i10 1, %indvar_flatten
  %indvar_flatten_next = select i1 %exitcond_flatten, i10 1, i10 %indvar_flatten_op
  br label %.preheader17

.preheader13:                                     ; preds = %.preheader17, %.preheader16
  %indvar_flatten2 = phi i10 [ %indvar_flatten_next4, %.preheader16 ], [ 0, %.preheader17 ]
  %filt = phi i4 [ %filt_mid2, %.preheader16 ], [ 0, %.preheader17 ]
  %indvar_flatten3 = phi i7 [ %indvar_flatten_next3, %.preheader16 ], [ 0, %.preheader17 ]
  %ch1 = phi i2 [ %ch1_mid2, %.preheader16 ], [ 0, %.preheader17 ]
  %indvar_flatten4 = phi i6 [ %indvar_flatten_next2, %.preheader16 ], [ 0, %.preheader17 ]
  %i2 = phi i3 [ %i2_mid2, %.preheader16 ], [ 0, %.preheader17 ]
  %j3 = phi i3 [ %j_2, %.preheader16 ], [ 0, %.preheader17 ]
  %exitcond_flatten4 = icmp eq i10 %indvar_flatten2, -274
  %indvar_flatten_next4 = add i10 %indvar_flatten2, 1
  br i1 %exitcond_flatten4, label %.preheader12, label %.preheader16

.preheader16:                                     ; preds = %.preheader13
  %filt_2 = add i4 1, %filt
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 750, i64 750, i64 750)
  %exitcond_flatten2 = icmp eq i7 %indvar_flatten3, -53
  %ch1_mid = select i1 %exitcond_flatten2, i2 0, i2 %ch1
  %not_exitcond_flatten1 = xor i1 %exitcond_flatten2, true
  %exitcond1 = icmp eq i3 %j3, -3
  %exitcond4_mid = and i1 %exitcond1, %not_exitcond_flatten1
  %exitcond_flatten3 = icmp eq i6 %indvar_flatten4, 25
  %exitcond_flatten24_mid = and i1 %exitcond_flatten3, %not_exitcond_flatten1
  %filt_mid2 = select i1 %exitcond_flatten2, i4 %filt_2, i4 %filt
  %tmp_3_cast = zext i4 %filt_mid2 to i7
  %tmp_16 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %filt_mid2, i2 0)
  %p_shl4_cast = zext i6 %tmp_16 to i7
  %tmp_17 = sub i7 %p_shl4_cast, %tmp_3_cast
  %tmp_25_cast = sext i7 %tmp_17 to i8
  %ch_2 = add i2 1, %ch1_mid
  %tmp_18 = or i1 %exitcond_flatten24_mid, %exitcond_flatten2
  %i2_mid = select i1 %tmp_18, i3 0, i3 %i2
  %exitcond_flatten24_not = xor i1 %exitcond_flatten3, true
  %not_exitcond_flatten24_mid = or i1 %exitcond_flatten2, %exitcond_flatten24_not
  %exitcond4_mid1 = and i1 %exitcond4_mid, %not_exitcond_flatten24_mid
  %ch1_mid2 = select i1 %exitcond_flatten24_mid, i2 %ch_2, i2 %ch1_mid
  %tmp_9_cast = zext i2 %ch1_mid2 to i8
  %tmp_19 = add i8 %tmp_9_cast, %tmp_25_cast
  %tmp_27_cast = sext i8 %tmp_19 to i64
  %tmp_20 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %tmp_19, i2 0)
  %p_shl7 = sext i10 %tmp_20 to i64
  %tmp_21 = add i64 %p_shl7, %tmp_27_cast
  %i_2 = add i3 1, %i2_mid
  %tmp_22 = or i1 %exitcond4_mid1, %exitcond_flatten24_mid
  %tmp_23 = or i1 %tmp_22, %exitcond_flatten2
  %j3_mid2 = select i1 %tmp_23, i3 0, i3 %j3
  %i2_mid2 = select i1 %exitcond4_mid1, i3 %i_2, i3 %i2_mid
  %tmp_10 = zext i3 %i2_mid2 to i64
  %tmp_24 = add i64 %tmp_10, %tmp_21
  %tmp_25 = trunc i64 %tmp_24 to i11
  %tmp_26 = trunc i64 %tmp_24 to i9
  %p_shl8_cast = call i11 @_ssdm_op_BitConcatenate.i11.i9.i2(i9 %tmp_26, i2 0)
  %tmp_27 = add i11 %p_shl8_cast, %tmp_25
  %tmp_12 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str5)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_6 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %in_stream_data_V, i4* %in_stream_keep_V, i4* %in_stream_strb_V, i4* %in_stream_user_V, i1* %in_stream_last_V, i5* %in_stream_id_V, i5* %in_stream_dest_V)
  %in_stream_data_V_val1 = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_6, 0
  %ret_2 = bitcast i32 %in_stream_data_V_val1 to float
  %tmp_13_cast = zext i3 %j3_mid2 to i11
  %tmp_28 = add i11 %tmp_13_cast, %tmp_27
  %tmp_34_cast = zext i11 %tmp_28 to i64
  %filter_addr = getelementptr [750 x float]* %filter, i64 0, i64 %tmp_34_cast
  store float %ret_2, float* %filter_addr, align 4
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str5, i32 %tmp_12)
  %j_2 = add i3 1, %j3_mid2
  %indvar_flatten22_op = add i6 1, %indvar_flatten4
  %indvar_flatten_next2 = select i1 %tmp_18, i6 1, i6 %indvar_flatten22_op
  %indvar_flatten36_op = add i7 1, %indvar_flatten3
  %indvar_flatten_next3 = select i1 %exitcond_flatten2, i7 1, i7 %indvar_flatten36_op
  br label %.preheader13

.preheader12:                                     ; preds = %.preheader13, %1
  %filt4 = phi i4 [ %filt_1, %1 ], [ 0, %.preheader13 ]
  %exitcond3 = icmp eq i4 %filt4, -6
  %filt_1 = add i4 %filt4, 1
  br i1 %exitcond3, label %2, label %1

; <label>:1                                       ; preds = %.preheader12
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 10, i64 10, i64 10)
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str6)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %empty_9 = call { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %in_stream_data_V, i4* %in_stream_keep_V, i4* %in_stream_strb_V, i4* %in_stream_user_V, i1* %in_stream_last_V, i5* %in_stream_id_V, i5* %in_stream_dest_V)
  %in_stream_data_V_val2 = extractvalue { i32, i4, i4, i4, i1, i5, i5 } %empty_9, 0
  %ret = bitcast i32 %in_stream_data_V_val2 to float
  %tmp_s = zext i4 %filt4 to i64
  %bias_addr = getelementptr inbounds [10 x float]* %bias, i64 0, i64 %tmp_s
  store float %ret, float* %bias_addr, align 4
  %empty_10 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str6, i32 %tmp_2)
  br label %.preheader12

; <label>:2                                       ; preds = %.preheader12
  call fastcc void @"Conv_Accel_conv_hw<24, 3, 10, 5, 20>"([1728 x float]* %image, [750 x float]* %filter, [10 x float]* %bias, [4000 x float]* %feature_map)
  br label %.preheader

.preheader:                                       ; preds = %2, %.preheader11.preheader
  %indvar_flatten5 = phi i12 [ 0, %2 ], [ %indvar_flatten_next6, %.preheader11.preheader ]
  %filt5 = phi i4 [ 0, %2 ], [ %filt5_mid2, %.preheader11.preheader ]
  %indvar_flatten6 = phi i10 [ 0, %2 ], [ %indvar_flatten_next5, %.preheader11.preheader ]
  %i6 = phi i5 [ 0, %2 ], [ %i6_mid2, %.preheader11.preheader ]
  %j7 = phi i5 [ 0, %2 ], [ %j_3, %.preheader11.preheader ]
  %exitcond_flatten6 = icmp eq i12 %indvar_flatten5, -96
  %indvar_flatten_next6 = add i12 %indvar_flatten5, 1
  br i1 %exitcond_flatten6, label %3, label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %.preheader
  %filt_3 = add i4 %filt5, 1
  %empty_11 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 4000, i64 4000, i64 4000)
  %exitcond_flatten5 = icmp eq i10 %indvar_flatten6, 400
  %i6_mid = select i1 %exitcond_flatten5, i5 0, i5 %i6
  %not_exitcond_flatten2 = xor i1 %exitcond_flatten5, true
  %exitcond2 = icmp eq i5 %j7, -12
  %exitcond_mid = and i1 %exitcond2, %not_exitcond_flatten2
  %filt5_mid2 = select i1 %exitcond_flatten5, i4 %filt_3, i4 %filt5
  %filt5_cast8 = zext i4 %filt5_mid2 to i12
  %tmp_7 = mul i12 %filt5_cast8, 400
  %tmp_29 = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %filt5_mid2, i4 0)
  %p_shl9_cast = zext i8 %tmp_29 to i9
  %tmp_30 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %filt5_mid2, i2 0)
  %p_shl10_cast = zext i6 %tmp_30 to i9
  %tmp_31 = add i9 %p_shl9_cast, %p_shl10_cast
  %i_3 = add i5 %i6_mid, 1
  %tmp_32 = or i1 %exitcond_mid, %exitcond_flatten5
  %j7_mid2 = select i1 %tmp_32, i5 0, i5 %j7
  %i6_mid2 = select i1 %exitcond_mid, i5 %i_3, i5 %i6_mid
  %p_shl5 = call i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5 %i6_mid2, i4 0)
  %p_shl6 = call i7 @_ssdm_op_BitConcatenate.i7.i5.i2(i5 %i6_mid2, i2 0)
  %p_shl6_cast = zext i7 %p_shl6 to i9
  %tmp_11_cast = zext i5 %i6_mid2 to i9
  %tmp_33 = add i9 %tmp_11_cast, %tmp_31
  %p_shl11_cast = call i13 @_ssdm_op_BitConcatenate.i13.i9.i4(i9 %tmp_33, i4 0)
  %tmp_34 = call i11 @_ssdm_op_BitConcatenate.i11.i9.i2(i9 %tmp_33, i2 0)
  %p_shl12_cast = zext i11 %tmp_34 to i13
  %tmp_35 = add i13 %p_shl11_cast, %p_shl12_cast
  %tmp = add i9 %p_shl5, %p_shl6_cast
  %tmp_cast = zext i9 %tmp to i12
  %j7_cast3 = zext i5 %j7_mid2 to i12
  %tmp_14 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str7)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str2) nounwind
  %tmp1 = add i12 %tmp_7, %j7_cast3
  %tmp_15 = add i12 %tmp1, %tmp_cast
  %tmp_16_cast = zext i5 %j7_mid2 to i13
  %tmp_36 = add i13 %tmp_16_cast, %tmp_35
  %tmp_44_cast = zext i13 %tmp_36 to i64
  %feature_map_addr = getelementptr [4000 x float]* %feature_map, i64 0, i64 %tmp_44_cast
  %last_assign = icmp eq i12 %tmp_15, -97
  %feature_map_load = load float* %feature_map_addr, align 4
  %val_assign = bitcast float %feature_map_load to i32
  call void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32* %out_stream_data_V, i4* %out_stream_keep_V, i4* %out_stream_strb_V, i4* %out_stream_user_V, i1* %out_stream_last_V, i5* %out_stream_id_V, i5* %out_stream_dest_V, i32 %val_assign, i4 -1, i4 -1, i4 0, i1 %last_assign, i5 0, i5 0)
  %empty_12 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str7, i32 %tmp_14)
  %j_3 = add i5 %j7_mid2, 1
  %indvar_flatten66_op = add i10 %indvar_flatten6, 1
  %indvar_flatten_next5 = select i1 %exitcond_flatten5, i10 1, i10 %indvar_flatten66_op
  br label %.preheader

; <label>:3                                       ; preds = %.preheader
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc void @"Conv_Accel_conv_hw<24, 3, 10, 5, 20>"([1728 x float]* nocapture %image_r, [750 x float]* nocapture %filter, [10 x float]* nocapture %bias, [4000 x float]* nocapture %feature_map) {
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader15, %0
  %filt = phi i4 [ 0, %0 ], [ %filt_4, %.preheader15 ]
  %exitcond8 = icmp eq i4 %filt, -6
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 10, i64 10, i64 10)
  %filt_4 = add i4 %filt, 1
  br i1 %exitcond8, label %.preheader13, label %.preheader15.preheader

.preheader15.preheader:                           ; preds = %.loopexit
  %tmp = zext i4 %filt to i64
  %tmp_s = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %filt, i4 0)
  %p_shl_cast = zext i8 %tmp_s to i9
  %tmp_37 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %filt, i2 0)
  %p_shl1_cast = zext i6 %tmp_37 to i9
  %tmp_38 = add i9 %p_shl1_cast, %p_shl_cast
  %bias_addr = getelementptr [10 x float]* %bias, i64 0, i64 %tmp
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader14, %.preheader15.preheader
  %i = phi i5 [ 0, %.preheader15.preheader ], [ %i_4, %.preheader14 ]
  %exitcond7 = icmp eq i5 %i, -12
  %empty_13 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20)
  %i_4 = add i5 %i, 1
  br i1 %exitcond7, label %.loopexit, label %.preheader14.preheader

.preheader14.preheader:                           ; preds = %.preheader15
  %tmp_17_cast = zext i5 %i to i9
  %tmp_43 = add i9 %tmp_17_cast, %tmp_38
  %p_shl2_cast = call i13 @_ssdm_op_BitConcatenate.i13.i9.i4(i9 %tmp_43, i4 0)
  %tmp_35 = call i11 @_ssdm_op_BitConcatenate.i11.i9.i2(i9 %tmp_43, i2 0)
  %p_shl3_cast = zext i11 %tmp_35 to i13
  %tmp_44 = add i13 %p_shl2_cast, %p_shl3_cast
  br label %.preheader14

.preheader14:                                     ; preds = %1, %.preheader14.preheader
  %j = phi i5 [ %j_4, %1 ], [ 0, %.preheader14.preheader ]
  %exitcond6 = icmp eq i5 %j, -12
  %empty_14 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20)
  %j_4 = add i5 %j, 1
  br i1 %exitcond6, label %.preheader15, label %1

; <label>:1                                       ; preds = %.preheader14
  %bias_load = load float* %bias_addr, align 4
  %tmp_19_cast = zext i5 %j to i13
  %tmp_50 = add i13 %tmp_44, %tmp_19_cast
  %tmp_63_cast = zext i13 %tmp_50 to i64
  %feature_map_addr = getelementptr [4000 x float]* %feature_map, i64 0, i64 %tmp_63_cast
  store float %bias_load, float* %feature_map_addr, align 4
  br label %.preheader14

.preheader13:                                     ; preds = %.preheader12, %.loopexit
  %filt1 = phi i4 [ 0, %.loopexit ], [ %filt_5, %.preheader12 ]
  %exitcond5 = icmp eq i4 %filt1, -6
  %empty_15 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 10, i64 10, i64 10)
  %filt_5 = add i4 %filt1, 1
  br i1 %exitcond5, label %2, label %.preheader12.preheader

.preheader12.preheader:                           ; preds = %.preheader13
  %tmp_cast = zext i4 %filt1 to i7
  %tmp_39 = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %filt1, i2 0)
  %p_shl6_cast1 = zext i6 %tmp_39 to i9
  %p_shl6_cast = zext i6 %tmp_39 to i7
  %tmp_40 = sub i7 %p_shl6_cast, %tmp_cast
  %tmp_49_cast = sext i7 %tmp_40 to i8
  %tmp_41 = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %filt1, i4 0)
  %p_shl4_cast = zext i8 %tmp_41 to i9
  %tmp_42 = add i9 %p_shl6_cast1, %p_shl4_cast
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader11, %.preheader12.preheader
  %ch = phi i2 [ 0, %.preheader12.preheader ], [ %ch_3, %.preheader11 ]
  %exitcond4 = icmp eq i2 %ch, -1
  %empty_16 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %ch_3 = add i2 %ch, 1
  br i1 %exitcond4, label %.preheader13, label %.preheader11.preheader

.preheader11.preheader:                           ; preds = %.preheader12
  %tmp_18_cast = zext i2 %ch to i8
  %tmp_45 = call i7 @_ssdm_op_BitConcatenate.i7.i2.i5(i2 %ch, i5 0)
  %p_shl8_cast = zext i7 %tmp_45 to i8
  %tmp_46 = call i5 @_ssdm_op_BitConcatenate.i5.i2.i3(i2 %ch, i3 0)
  %p_shl9_cast = zext i5 %tmp_46 to i8
  %tmp_47 = sub i8 %p_shl8_cast, %p_shl9_cast
  %tmp_59_cast = sext i8 %tmp_47 to i9
  %tmp_48 = add i8 %tmp_49_cast, %tmp_18_cast
  %tmp_60_cast = sext i8 %tmp_48 to i64
  %tmp_36 = call i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8 %tmp_48, i2 0)
  %p_shl7 = sext i10 %tmp_36 to i64
  %tmp_49 = add i64 %tmp_60_cast, %p_shl7
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader10, %.preheader11.preheader
  %i2 = phi i5 [ 0, %.preheader11.preheader ], [ %i_5, %.preheader10 ]
  %exitcond3 = icmp eq i5 %i2, -12
  %empty_17 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20)
  %i_5 = add i5 %i2, 1
  br i1 %exitcond3, label %.preheader12, label %.preheader10.preheader

.preheader10.preheader:                           ; preds = %.preheader11
  %tmp_20_cast = zext i5 %i2 to i9
  %tmp_51 = add i9 %tmp_20_cast, %tmp_42
  %p_shl10_cast = call i13 @_ssdm_op_BitConcatenate.i13.i9.i4(i9 %tmp_51, i4 0)
  %tmp_52 = call i11 @_ssdm_op_BitConcatenate.i11.i9.i2(i9 %tmp_51, i2 0)
  %p_shl11_cast = zext i11 %tmp_52 to i13
  %tmp_53 = add i13 %p_shl10_cast, %p_shl11_cast
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader9, %.preheader10.preheader
  %j3 = phi i5 [ 0, %.preheader10.preheader ], [ %j_5, %.preheader9 ]
  %exitcond2 = icmp eq i5 %j3, -12
  %empty_18 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20)
  %j_5 = add i5 %j3, 1
  br i1 %exitcond2, label %.preheader11, label %.preheader9.preheader

.preheader9.preheader:                            ; preds = %.preheader10
  %tmp_21_cast = zext i5 %j3 to i13
  %tmp_54 = add i13 %tmp_53, %tmp_21_cast
  %tmp_68_cast = zext i13 %tmp_54 to i64
  %feature_map_addr_1 = getelementptr [4000 x float]* %feature_map, i64 0, i64 %tmp_68_cast
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader, %.preheader9.preheader
  %lt_i = phi i3 [ 0, %.preheader9.preheader ], [ %lt_i_1, %.preheader ]
  %lt_i_cast4 = zext i3 %lt_i to i5
  %exitcond1 = icmp eq i3 %lt_i, -3
  %empty_19 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5)
  %lt_i_1 = add i3 %lt_i, 1
  br i1 %exitcond1, label %.preheader10, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader9
  %tmp_22 = add i5 %i2, %lt_i_cast4
  %tmp_23 = zext i3 %lt_i to i64
  %tmp_55 = add i64 %tmp_23, %tmp_49
  %tmp_56 = trunc i64 %tmp_55 to i11
  %tmp_57 = trunc i64 %tmp_55 to i9
  %p_shl14_cast = call i11 @_ssdm_op_BitConcatenate.i11.i9.i2(i9 %tmp_57, i2 0)
  %tmp_58 = add i11 %p_shl14_cast, %tmp_56
  %tmp_24_cast = zext i5 %tmp_22 to i9
  %tmp_59 = add i9 %tmp_24_cast, %tmp_59_cast
  %tmp_60 = trunc i9 %tmp_59 to i7
  %p_shl12_cast = call i12 @_ssdm_op_BitConcatenate.i12.i7.i5(i7 %tmp_60, i5 0)
  %p_shl13_cast = call i12 @_ssdm_op_BitConcatenate.i12.i9.i3(i9 %tmp_59, i3 0)
  %tmp_61 = sub i12 %p_shl12_cast, %p_shl13_cast
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %lt_j = phi i3 [ %lt_j_1, %._crit_edge ], [ 0, %.preheader.preheader ]
  %lt_j_cast2 = zext i3 %lt_j to i5
  %exitcond = icmp eq i3 %lt_j, -3
  %empty_20 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5)
  %lt_j_1 = add i3 %lt_j, 1
  br i1 %exitcond, label %.preheader9, label %._crit_edge

._crit_edge:                                      ; preds = %.preheader
  %tmp_25_cast = zext i3 %lt_j to i11
  %tmp_62 = add i11 %tmp_58, %tmp_25_cast
  %tmp_76_cast = zext i11 %tmp_62 to i64
  %filter_addr = getelementptr [750 x float]* %filter, i64 0, i64 %tmp_76_cast
  %filter_load = load float* %filter_addr, align 4
  %tmp_26 = add i5 %lt_j_cast2, %j3
  %tmp_27_cast = zext i5 %tmp_26 to i12
  %tmp_63 = add i12 %tmp_61, %tmp_27_cast
  %tmp_77_cast = zext i12 %tmp_63 to i64
  %image_addr = getelementptr [1728 x float]* %image_r, i64 0, i64 %tmp_77_cast
  %image_load = load float* %image_addr, align 4
  %tmp_28 = fmul float %filter_load, %image_load
  %feature_map_load = load float* %feature_map_addr_1, align 4
  %tmp_29 = fadd float %feature_map_load, %tmp_28
  store float %tmp_29, float* %feature_map_addr_1, align 4
  br label %.preheader

; <label>:2                                       ; preds = %.preheader13
  ret void
}

define weak void @_ssdm_op_Write.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32*, i4*, i4*, i4*, i1*, i5*, i5*, i32, i4, i4, i4, i1, i5, i5) {
entry:
  store i32 %7, i32* %0
  store i4 %8, i4* %1
  store i4 %9, i4* %2
  store i4 %10, i4* %3
  store i1 %11, i1* %4
  store i5 %12, i5* %5
  store i5 %13, i5* %6
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak { i32, i4, i4, i4, i1, i5, i5 } @_ssdm_op_Read.axis.volatile.i32P.i4P.i4P.i4P.i1P.i5P.i5P(i32*, i4*, i4*, i4*, i1*, i5*, i5*) {
entry:
  %empty = load i32* %0
  %empty_21 = load i4* %1
  %empty_22 = load i4* %2
  %empty_23 = load i4* %3
  %empty_24 = load i1* %4
  %empty_25 = load i5* %5
  %empty_26 = load i5* %6
  %mrv_0 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } undef, i32 %empty, 0
  %mrv1 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv_0, i4 %empty_21, 1
  %mrv2 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv1, i4 %empty_22, 2
  %mrv3 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv2, i4 %empty_23, 3
  %mrv4 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv3, i1 %empty_24, 4
  %mrv5 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv4, i5 %empty_25, 5
  %mrv6 = insertvalue { i32, i4, i4, i4, i1, i5, i5 } %mrv5, i5 %empty_26, 6
  ret { i32, i4, i4, i4, i1, i5, i5 } %mrv6
}

declare i9 @_ssdm_op_PartSelect.i9.i64.i32.i32(i64, i32, i32) nounwind readnone

declare i7 @_ssdm_op_PartSelect.i7.i9.i32.i32(i9, i32, i32) nounwind readnone

declare i11 @_ssdm_op_PartSelect.i11.i64.i32.i32(i64, i32, i32) nounwind readnone

declare i16 @_ssdm_op_HSub(...)

declare i16 @_ssdm_op_HMul(...)

declare i16 @_ssdm_op_HDiv(...)

declare i16 @_ssdm_op_HAdd(...)

define weak i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5, i4) nounwind readnone {
entry:
  %empty = zext i5 %0 to i9
  %empty_27 = zext i4 %1 to i9
  %empty_28 = shl i9 %empty, 4
  %empty_29 = or i9 %empty_28, %empty_27
  ret i9 %empty_29
}

define weak i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4, i4) nounwind readnone {
entry:
  %empty = zext i4 %0 to i8
  %empty_30 = zext i4 %1 to i8
  %empty_31 = shl i8 %empty, 4
  %empty_32 = or i8 %empty_31, %empty_30
  ret i8 %empty_32
}

define weak i7 @_ssdm_op_BitConcatenate.i7.i5.i2(i5, i2) nounwind readnone {
entry:
  %empty = zext i5 %0 to i7
  %empty_33 = zext i2 %1 to i7
  %empty_34 = shl i7 %empty, 2
  %empty_35 = or i7 %empty_34, %empty_33
  ret i7 %empty_35
}

define weak i7 @_ssdm_op_BitConcatenate.i7.i2.i5(i2, i5) nounwind readnone {
entry:
  %empty = zext i2 %0 to i7
  %empty_36 = zext i5 %1 to i7
  %empty_37 = shl i7 %empty, 5
  %empty_38 = or i7 %empty_37, %empty_36
  ret i7 %empty_38
}

define weak i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4, i2) nounwind readnone {
entry:
  %empty = zext i4 %0 to i6
  %empty_39 = zext i2 %1 to i6
  %empty_40 = shl i6 %empty, 2
  %empty_41 = or i6 %empty_40, %empty_39
  ret i6 %empty_41
}

define weak i5 @_ssdm_op_BitConcatenate.i5.i2.i3(i2, i3) nounwind readnone {
entry:
  %empty = zext i2 %0 to i5
  %empty_42 = zext i3 %1 to i5
  %empty_43 = shl i5 %empty, 3
  %empty_44 = or i5 %empty_43, %empty_42
  ret i5 %empty_44
}

define weak i13 @_ssdm_op_BitConcatenate.i13.i9.i4(i9, i4) nounwind readnone {
entry:
  %empty = zext i9 %0 to i13
  %empty_45 = zext i4 %1 to i13
  %empty_46 = shl i13 %empty, 4
  %empty_47 = or i13 %empty_46, %empty_45
  ret i13 %empty_47
}

define weak i12 @_ssdm_op_BitConcatenate.i12.i9.i3(i9, i3) nounwind readnone {
entry:
  %empty = zext i9 %0 to i12
  %empty_48 = zext i3 %1 to i12
  %empty_49 = shl i12 %empty, 3
  %empty_50 = or i12 %empty_49, %empty_48
  ret i12 %empty_50
}

define weak i12 @_ssdm_op_BitConcatenate.i12.i7.i5(i7, i5) nounwind readnone {
entry:
  %empty = zext i7 %0 to i12
  %empty_51 = zext i5 %1 to i12
  %empty_52 = shl i12 %empty, 5
  %empty_53 = or i12 %empty_52, %empty_51
  ret i12 %empty_53
}

define weak i11 @_ssdm_op_BitConcatenate.i11.i9.i2(i9, i2) nounwind readnone {
entry:
  %empty = zext i9 %0 to i11
  %empty_54 = zext i2 %1 to i11
  %empty_55 = shl i11 %empty, 2
  %empty_56 = or i11 %empty_55, %empty_54
  ret i11 %empty_56
}

define weak i10 @_ssdm_op_BitConcatenate.i10.i8.i2(i8, i2) nounwind readnone {
entry:
  %empty = zext i8 %0 to i10
  %empty_57 = zext i2 %1 to i10
  %empty_58 = shl i10 %empty, 2
  %empty_59 = or i10 %empty_58, %empty_57
  ret i10 %empty_59
}

declare void @_GLOBAL__I_a() nounwind

define void @Conv_Accel(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V, i32* %OUTPUT_STREAM_data_V, i4* %OUTPUT_STREAM_keep_V, i4* %OUTPUT_STREAM_strb_V, i4* %OUTPUT_STREAM_user_V, i1* %OUTPUT_STREAM_last_V, i5* %OUTPUT_STREAM_id_V, i5* %OUTPUT_STREAM_dest_V) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %INPUT_STREAM_data_V), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %INPUT_STREAM_keep_V), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %INPUT_STREAM_strb_V), !map !17
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %INPUT_STREAM_user_V), !map !21
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %INPUT_STREAM_last_V), !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %INPUT_STREAM_id_V), !map !29
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %INPUT_STREAM_dest_V), !map !33
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %OUTPUT_STREAM_data_V), !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %OUTPUT_STREAM_keep_V), !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %OUTPUT_STREAM_strb_V), !map !47
  call void (...)* @_ssdm_op_SpecBitsMap(i4* %OUTPUT_STREAM_user_V), !map !51
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %OUTPUT_STREAM_last_V), !map !55
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %OUTPUT_STREAM_id_V), !map !59
  call void (...)* @_ssdm_op_SpecBitsMap(i5* %OUTPUT_STREAM_dest_V), !map !63
  call void (...)* @_ssdm_op_SpecTopModule([11 x i8]* @Conv_Accel_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [12 x i8]* @p_str1, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %OUTPUT_STREAM_data_V, i4* %OUTPUT_STREAM_keep_V, i4* %OUTPUT_STREAM_strb_V, i4* %OUTPUT_STREAM_user_V, i1* %OUTPUT_STREAM_last_V, i5* %OUTPUT_STREAM_id_V, i5* %OUTPUT_STREAM_dest_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  call void (...)* @_ssdm_op_SpecInterface(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V, [5 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2, [1 x i8]* @p_str2)
  call fastcc void @Conv_Accel_wrapped_conv_hw(i32* %INPUT_STREAM_data_V, i4* %INPUT_STREAM_keep_V, i4* %INPUT_STREAM_strb_V, i4* %INPUT_STREAM_user_V, i1* %INPUT_STREAM_last_V, i5* %INPUT_STREAM_id_V, i5* %INPUT_STREAM_dest_V, i32* %OUTPUT_STREAM_data_V, i4* %OUTPUT_STREAM_keep_V, i4* %OUTPUT_STREAM_strb_V, i4* %OUTPUT_STREAM_user_V, i1* %OUTPUT_STREAM_last_V, i5* %OUTPUT_STREAM_id_V, i5* %OUTPUT_STREAM_dest_V)
  ret void
}

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"INPUT_STREAM.data.V", metadata !11, metadata !"uint32", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 2487, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 3, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"INPUT_STREAM.keep.V", metadata !11, metadata !"uint4", i32 0, i32 3}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 3, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"INPUT_STREAM.strb.V", metadata !11, metadata !"uint4", i32 0, i32 3}
!21 = metadata !{metadata !22}
!22 = metadata !{i32 0, i32 3, metadata !23}
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !"INPUT_STREAM.user.V", metadata !11, metadata !"uint4", i32 0, i32 3}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 0, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"INPUT_STREAM.last.V", metadata !11, metadata !"uint1", i32 0, i32 0}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 0, i32 4, metadata !31}
!31 = metadata !{metadata !32}
!32 = metadata !{metadata !"INPUT_STREAM.id.V", metadata !11, metadata !"uint5", i32 0, i32 4}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 0, i32 4, metadata !35}
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !"INPUT_STREAM.dest.V", metadata !11, metadata !"uint5", i32 0, i32 4}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 31, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"OUTPUT_STREAM.data.V", metadata !41, metadata !"uint32", i32 0, i32 31}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 3999, i32 1}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 3, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"OUTPUT_STREAM.keep.V", metadata !41, metadata !"uint4", i32 0, i32 3}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 3, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"OUTPUT_STREAM.strb.V", metadata !41, metadata !"uint4", i32 0, i32 3}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 3, metadata !53}
!53 = metadata !{metadata !54}
!54 = metadata !{metadata !"OUTPUT_STREAM.user.V", metadata !41, metadata !"uint4", i32 0, i32 3}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 0, i32 0, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"OUTPUT_STREAM.last.V", metadata !41, metadata !"uint1", i32 0, i32 0}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 0, i32 4, metadata !61}
!61 = metadata !{metadata !62}
!62 = metadata !{metadata !"OUTPUT_STREAM.id.V", metadata !41, metadata !"uint5", i32 0, i32 4}
!63 = metadata !{metadata !64}
!64 = metadata !{i32 0, i32 4, metadata !65}
!65 = metadata !{metadata !66}
!66 = metadata !{metadata !"OUTPUT_STREAM.dest.V", metadata !41, metadata !"uint5", i32 0, i32 4}
