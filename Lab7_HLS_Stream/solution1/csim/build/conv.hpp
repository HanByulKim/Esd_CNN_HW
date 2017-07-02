#include <assert.h>
#include <ap_axi_sdata.h>

typedef ap_axiu<32,4,5,5> AXI_VAL;

// FIXME: Change topology according to your network
#define IMAGE_SIZE_1 24
#define NUM_FEATURES_1 3
#define NUM_FILTERS_1 10
#define FILTER_SIZE_1 5
#define OUTPUT_SIZE_1 20

//length of AXI streams.
#define INPUT_LENGTH_1 (IMAGE_SIZE_1*IMAGE_SIZE_1*NUM_FEATURES_1+NUM_FILTERS_1*NUM_FEATURES_1*FILTER_SIZE_1*FILTER_SIZE_1+NUM_FILTERS_1)
#define OUTPUT_LENGTH_1 (NUM_FILTERS_1*OUTPUT_SIZE_1*OUTPUT_SIZE_1)

#define w_t float

void standalone_conv (w_t image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1],
		w_t filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1],
		w_t bias[NUM_FILTERS_1],
		w_t feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1]);
		
/* ****************************** C++ TEMPLATES ************************************** */

template <int IMAGE_SIZE, int NUM_FEATURES, int NUM_FILTERS, int FILTER_SIZE, int OUTPUT_SIZE>
void conv_hw(
	w_t image[NUM_FEATURES][IMAGE_SIZE][IMAGE_SIZE],
	w_t filter[NUM_FILTERS][NUM_FEATURES][FILTER_SIZE][FILTER_SIZE],
	w_t bias[NUM_FILTERS],
	w_t feature_map[NUM_FILTERS][OUTPUT_SIZE][OUTPUT_SIZE]
)
{
	// FIXME: Implement Convolution Herew_t *image,                           // max_pool1(12*12*5) input image
    
	int pad=0;                          // number of padding
	int stride=1;                      // number of stride

	int feature_sizex = OUTPUT_SIZE;
	int feature_sizey = OUTPUT_SIZE;
	int image_sizex = IMAGE_SIZE;
	int image_sizey = IMAGE_SIZE;

	for (int filt = 0; filt < NUM_FILTERS; filt++){
		for (int i = 0; i < feature_sizey; i++){ //8
			for (int j = 0; j < feature_sizex; j++){ //8
				feature_map[filt][i][j] = bias[filt];
			}
		}
	}
	for(int filt=0; filt<NUM_FILTERS; filt++){
		for(int ch=0; ch<NUM_FEATURES; ch++){
			for(int i=0; i<feature_sizey; i++){ //8
				for(int j=0; j<feature_sizex; j++){ //8
					for(int lt_i=0; lt_i<FILTER_SIZE; lt_i++){ //i
						for(int lt_j=0; lt_j<FILTER_SIZE; lt_j++){ //j
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

// --------------------------------------------------------
// functions to insert and extract elements from an axi stream
// includes conversion to correct data type

template <typename T, int U, int TI, int TD>
T pop_stream(ap_axiu <sizeof(T)*8,U,TI,TD> const &e)
{
#pragma HLS INLINE

	assert(sizeof(T) == sizeof(int));
	union
	{
		int ival;
		T oval;
	} converter;
	converter.ival = e.data;
	T ret = converter.oval;

	volatile ap_uint<sizeof(T)> strb = e.strb;
	volatile ap_uint<sizeof(T)> keep = e.keep;
	volatile ap_uint<U> user = e.user;
	volatile ap_uint<1> last = e.last;
	volatile ap_uint<TI> id = e.id;
	volatile ap_uint<TD> dest = e.dest;

	return ret;
}

template <typename T, int U, int TI, int TD>
ap_axiu <sizeof(T)*8,U,TI,TD>push_stream(T const &v, bool last = false)
{
#pragma HLS INLINE
	ap_axiu<sizeof(T)*8,U,TI,TD> e;

	assert(sizeof(T) == sizeof(int));
	union
	{
		int oval;
		T ival;
	} converter;
	converter.ival = v;
	e.data = converter.oval;

	// set it to sizeof(T) ones
	e.strb = -1;
	e.keep = 15; //e.strb;
	e.user = 0;
	e.last = last ? 1 : 0;
	e.id = 0;
	e.dest = 0;
	return e;
}

// --------------------------------------------------------------------
// function to be accelerated in HW wrapped with AXI4-Stream interface

template <int IMAGE_SIZE, int NUM_FEATURES, int NUM_FILTERS, int FILTER_SIZE, int OUTPUT_SIZE, int U, int TI, int TD>
void wrapped_conv_hw(
	AXI_VAL in_stream[IMAGE_SIZE*IMAGE_SIZE*NUM_FEATURES
	+ NUM_FILTERS*NUM_FEATURES*FILTER_SIZE*FILTER_SIZE
	+ NUM_FILTERS],
	AXI_VAL out_stream[NUM_FILTERS*OUTPUT_SIZE*OUTPUT_SIZE])
{
	w_t image[NUM_FEATURES][IMAGE_SIZE][IMAGE_SIZE];
	w_t filter[NUM_FILTERS][NUM_FEATURES][FILTER_SIZE][FILTER_SIZE];
	w_t bias[NUM_FILTERS];
	w_t feature_map[NUM_FILTERS][OUTPUT_SIZE][OUTPUT_SIZE];
	
	// FIXME
	// 1. load input image.
	for(int ch=0; ch<NUM_FEATURES; ch++){
		for(int i=0; i<IMAGE_SIZE; i++){
			for(int j=0; j<IMAGE_SIZE; j++){
				#pragma HLS PIPELINE II=1
				image[ch][i][j]=pop_stream<w_t,U,TI,TD>(in_stream[IMAGE_SIZE*IMAGE_SIZE*ch + IMAGE_SIZE*i + j]);
			}
		}
	}

	// 2. load filters.
	for(int filt=0; filt<NUM_FILTERS; filt++){
		for(int ch=0; ch<NUM_FEATURES; ch++){
			for(int i=0; i<FILTER_SIZE; i++){
				for(int j=0; j<FILTER_SIZE; j++){
					#pragma HLS PIPELINE II=1
					filter[filt][ch][i][j]=pop_stream<w_t,U,TI,TD>(in_stream[IMAGE_SIZE*IMAGE_SIZE*NUM_FEATURES + FILTER_SIZE*FILTER_SIZE*NUM_FEATURES*filt + FILTER_SIZE*FILTER_SIZE*ch + FILTER_SIZE*i + j]);
				}
			}
		}
	}

	// 3. load bias.
	for(int filt=0; filt<NUM_FILTERS; filt++){
		#pragma HLS PIPELINE II=1
		bias[filt] = pop_stream<w_t,U,TI,TD>(in_stream[IMAGE_SIZE*IMAGE_SIZE*NUM_FEATURES + NUM_FILTERS*NUM_FEATURES*FILTER_SIZE*FILTER_SIZE + filt]);
	}

	// 4. do convolution.
	conv_hw<IMAGE_SIZE, NUM_FEATURES, NUM_FILTERS, FILTER_SIZE, OUTPUT_SIZE>(
	 image,
	 filter,
	 bias,
	 feature_map
	);

	// 5. store output.
	for(int filt=0; filt<NUM_FILTERS; filt++){
		for(int i=0; i<OUTPUT_SIZE; i++){
			for(int j=0; j<OUTPUT_SIZE; j++){
				#pragma HLS PIPELINE II=1
				out_stream[OUTPUT_SIZE*OUTPUT_SIZE*filt + OUTPUT_SIZE*i + j]=push_stream<w_t,U,TI,TD>(feature_map[NUM_FILTERS][OUTPUT_SIZE][OUTPUT_SIZE], (OUTPUT_SIZE*OUTPUT_SIZE*filt + OUTPUT_SIZE*i + j) == (OUTPUT_SIZE*OUTPUT_SIZE*NUM_FILTERS-1));
			}
		}
	}
}

