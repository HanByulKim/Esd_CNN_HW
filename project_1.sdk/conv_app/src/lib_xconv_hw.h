
// FIXME: Change topology according to your network
#define IMAGE_SIZE_1 24
#define NUM_FEATURES_1 3
#define NUM_FILTERS_1 10
#define FILTER_SIZE_1 5
#define OUTPUT_SIZE_1 20


//length of AXI streams.
#define INPUT_LENGTH_1 (IMAGE_SIZE_1*IMAGE_SIZE_1*NUM_FEATURES_1+NUM_FILTERS_1*NUM_FEATURES_1*FILTER_SIZE_1*FILTER_SIZE_1+NUM_FILTERS_1)
#define OUTPUT_LENGTH_1 (NUM_FILTERS_1*OUTPUT_SIZE_1*OUTPUT_SIZE_1)

#ifndef H_LIB_EXAMPLE_HW_H
#define H_LIB_EXAMPLE_HW_H


int Setup_HW_Accelerator(float image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1], float filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1], float bias[NUM_FILTERS_1], float feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1], int dma_size);

int Run_HW_Accelerator(float image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1], float filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1], float bias[NUM_FILTERS_1], float feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1], int dma_size);

int Start_HW_Accelerator(void);

void matrix_conv_ref(float image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1], float filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1], float bias[NUM_FILTERS_1], float feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1]);

#endif
