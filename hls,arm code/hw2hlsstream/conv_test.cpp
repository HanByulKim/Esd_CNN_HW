#include <stdio.h>
#include <stdlib.h>
#include "conv.hpp"
#include "./bias.h"
#include "./input_image.h"
#include "./output.h"
#include "./weight.h"

void conv_sw(
		w_t image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1],
		w_t filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1],
		w_t bias[NUM_FILTERS_1],
		w_t feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1]
)
{
	// SW Reference
	int32_t pad=0;                          // number of padding
	uint32_t stride=1;                      // number of stride

	uint32_t feature_sizex = OUTPUT_SIZE_1;
	uint32_t feature_sizey = OUTPUT_SIZE_1;
	uint32_t image_sizex = IMAGE_SIZE_1;
	uint32_t image_sizey = IMAGE_SIZE_1;

	for (int filt = 0; filt < NUM_FILTERS_1; filt++){
		for (int i = 0; i < feature_sizey; i++){ //8
			for (int j = 0; j < feature_sizex; j++){ //8
				feature_map[filt][i][j] = bias[filt];
			}
		}
	}
	for(int filt=0; filt<NUM_FILTERS_1; filt++){
		for(int ch=0; ch<NUM_FEATURES_1; ch++){
			for(int i=0; i<feature_sizey; i++){ //8
				for(int j=0; j<feature_sizex; j++){ //8
					for(int lt_i=0; lt_i<FILTER_SIZE_1; lt_i++){ //i
						for(int lt_j=0; lt_j<FILTER_SIZE_1; lt_j++){ //j
							if ((lt_i + i*stride - pad >= 0) || (lt_j + j*stride - pad >= 0) || (lt_i + i*stride - pad < image_sizey) || (lt_j + j*stride - pad < image_sizex)){
								feature_map[filt][i][j] += filter[filt][ch][lt_i][lt_j] * image[ch][lt_i + i*stride - pad][lt_j + j*stride - pad];
							}
						}
					}
				}
			}
		}
	}
}

int main(void)
{
	int ret_val = 0;

	int i,j,k, f, err;

	w_t image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1];
	w_t filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1];
	w_t bias[NUM_FILTERS_1] = {0.5};
	w_t feature_map_sw[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1];
	w_t feature_map_hw[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1];

	for(i=0; i<NUM_FEATURES_1; i++){
			for(j=0; j<IMAGE_SIZE_1; j++){
				for(k=0; k<IMAGE_SIZE_1; k++){
					image[i][j][k] = input_image[IMAGE_SIZE_1*IMAGE_SIZE_1*i + IMAGE_SIZE_1*j + k];
				}
			}
		}

		for(i=0; i<NUM_FILTERS_1; i++){
			bias[i]=bias_c[i];
		}

		for(f=0; f<NUM_FILTERS_1; f++){
			for(i=0; i<NUM_FEATURES_1; i++){
				for(j=0; j<FILTER_SIZE_1; j++){
					for(k=0; k<FILTER_SIZE_1; k++){
						filter[f][i][j][k] = weight_conv[NUM_FEATURES_1*FILTER_SIZE_1*FILTER_SIZE_1*f + FILTER_SIZE_1*FILTER_SIZE_1*i + FILTER_SIZE_1*j + k];
					}
				}
			}
		}
	standalone_conv(image, filter, bias, feature_map_hw);
	/* reference Convolution */
	conv_sw(image, filter, bias, feature_map_sw);

	/** Output comparison */
	err = 0;
	for (i = 0; (i<NUM_FILTERS_1 && !err); i++)
		for (j = 0; (j<OUTPUT_SIZE_1 && !err); j++)
			for (k = 0; (k<OUTPUT_SIZE_1 && !err); k++)
				printf("[%d][%d][%d] %f, %f",i,j,k,feature_map_hw[i][j][k],output[i*OUTPUT_SIZE_1*OUTPUT_SIZE_1 + j*OUTPUT_SIZE_1 + k]);
				if (fabs(feature_map_hw[i][j][k] - feature_map_sw[i][j][k])>0.00001)
					err++;

	if (err == 0)
		printf("Matrixes identical ... Test successful!\r\n");
	else
		printf("Test failed!\r\n");

	return err;
}

