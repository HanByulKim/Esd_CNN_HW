#include "conv.hpp"

// For testbench
void standalone_conv (
		w_t image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1],
		w_t filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1],
		w_t bias[NUM_FILTERS_1],
		w_t feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1]
)
{
	conv_hw<IMAGE_SIZE_1, NUM_FEATURES_1, NUM_FILTERS_1, FILTER_SIZE_1, OUTPUT_SIZE_1>
	(image, filter, bias, feature_map);
}

void Conv_Accel(AXI_VAL INPUT_STREAM[INPUT_LENGTH_1], AXI_VAL OUTPUT_STREAM[OUTPUT_LENGTH_1])
{
#pragma HLS INTERFACE s_axilite port=return     bundle=CONTROL_BUS
#pragma HLS INTERFACE axis      port=OUTPUT_STREAM
#pragma HLS INTERFACE axis      port=INPUT_STREAM
	wrapped_conv_hw <IMAGE_SIZE_1, NUM_FEATURES_1, NUM_FILTERS_1, FILTER_SIZE_1, OUTPUT_SIZE_1,
	4,5,5>(INPUT_STREAM, OUTPUT_STREAM);
	return;
}

