


#include "platform.h"
#include "xparameters.h"
#include "xscugic.h"
#include "xaxidma.h"
//#include "xconv_accel_core.h"
#include "xconv_accel.h"
#include "lib_xconv_hw.h"
#include "xil_printf.h"




volatile static int RunExample = 0;
volatile static int ResultExample = 0;

XConv_accel xconv_dev;

XConv_accel_Config xconv_config = {
	0,
	XPAR_CONV_ACCEL_0_S_AXI_CONTROL_BUS_BASEADDR
};

//Interrupt Controller Instance
XScuGic ScuGic;

// AXI DMA Instance
extern XAxiDma AxiDma;


int xconvSetup(){
	return XConv_accel_CfgInitialize(&xconv_dev,&xconv_config);
}

void xconvStart(void *InstancePtr){
	XConv_accel *pExample = (XConv_accel *)InstancePtr;
	XConv_accel_InterruptEnable(pExample,1);
	XConv_accel_InterruptGlobalEnable(pExample);
	XConv_accel_Start(pExample);
}


void xconvIsr(void *InstancePtr){
	XConv_accel *pExample = (XConv_accel *)InstancePtr;

	//Disable the global interrupt
	XConv_accel_InterruptGlobalDisable(pExample);
	//Disable the local interrupt
	XConv_accel_InterruptDisable(pExample,0xffffffff);

	// clear the local interrupt
	XConv_accel_InterruptClear(pExample,1);

	ResultExample = 1;
	// restart the core if it should run again
	if(RunExample){
		xconvStart(pExample);
	}
}

int xconvSetupInterrupt()
{
	//This functions sets up the interrupt on the ARM
	int result;
	XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
	if (pCfg == NULL){
		print("Interrupt Configuration Lookup Failed\n\r");
		return XST_FAILURE;
	}
	result = XScuGic_CfgInitialize(&ScuGic,pCfg,pCfg->CpuBaseAddress);
	if(result != XST_SUCCESS){
		return result;
	}
	// self test
	result = XScuGic_SelfTest(&ScuGic);
	if(result != XST_SUCCESS){
		return result;
	}
	// Initialize the exception handler
	Xil_ExceptionInit();
	// Register the exception handler
	//print("Register the exception handler\n\r");
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,&ScuGic);
	//Enable the exception handler
	Xil_ExceptionEnable();
	// Connect the Adder ISR to the exception table
	//print("Connect the Adder ISR to the Exception handler table\n\r");
	result = XScuGic_Connect(&ScuGic,XPAR_FABRIC_CONV_ACCEL_0_INTERRUPT_INTR,(Xil_InterruptHandler)xconvIsr,&xconv_dev);
	if(result != XST_SUCCESS){
		return result;
	}
	//print("Enable the Adder ISR\n\r");
	XScuGic_Enable(&ScuGic,XPAR_FABRIC_CONV_ACCEL_0_INTERRUPT_INTR);
	return XST_SUCCESS;
}

int Setup_HW_Accelerator(float image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1], float filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1], float bias[NUM_FILTERS_1], float feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1], int dma_size)//Setup the Vivado HLS Block
{
	int status = xconvSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  xconvSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//XConv_accel_core_SetVal1(&xconv_dev,val1);
	//XConv_accel_core_SetVal2(&xconv_dev,val2);
	xconvStart(&xconv_dev);
	// DMA NUMBER
	unsigned int DMA_IMAGE=NUM_FEATURES_1*IMAGE_SIZE_1*IMAGE_SIZE_1*sizeof(float);
	unsigned int DMA_FILTER=NUM_FILTERS_1*NUM_FEATURES_1*FILTER_SIZE_1*FILTER_SIZE_1*sizeof(float);
	unsigned int DMA_BIAS=NUM_FILTERS_1*sizeof(float);
	unsigned int DMA_FEATUREMAP=NUM_FILTERS_1*OUTPUT_SIZE_1*OUTPUT_SIZE_1*sizeof(float);
	//flush the cache
	Xil_DCacheFlushRange((unsigned int)image,DMA_IMAGE);
	Xil_DCacheFlushRange((unsigned int)filter,DMA_FILTER);
	Xil_DCacheFlushRange((unsigned int)bias,DMA_BIAS);
	Xil_DCacheFlushRange((unsigned int)feature_map,DMA_FEATUREMAP);
	print("\rCache cleared\n\r");

	return 0;
}


void matrix_conv_ref(float image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1], float filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1], float bias[NUM_FILTERS_1], float feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1])
{
		int pad=0;                          // number of padding
		int stride=1;                      // number of stride

		int feature_sizex = OUTPUT_SIZE_1;
		int feature_sizey = OUTPUT_SIZE_1;
		int image_sizex = IMAGE_SIZE_1;
		int image_sizey = IMAGE_SIZE_1;
		int filt, i, j, ch, lt_i, lt_j;

		for (filt = 0; filt < NUM_FILTERS_1; filt++){
			for (i = 0; i < feature_sizey; i++){ //8
				for (j = 0; j < feature_sizex; j++){ //8
					feature_map[filt][i][j] = bias[filt];
				}
			}
		}
		for(filt=0; filt<NUM_FILTERS_1; filt++){
			for(ch=0; ch<NUM_FEATURES_1; ch++){
				for(i=0; i<feature_sizey; i++){ //8
					for(j=0; j<feature_sizex; j++){ //8
						for(lt_i=0; lt_i<FILTER_SIZE_1; lt_i++){ //i
							for(lt_j=0; lt_j<FILTER_SIZE_1; lt_j++){ //j
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


int Start_HW_Accelerator(void)
{
	int status = xconvSetup();
	if(status != XST_SUCCESS){
		print("Error: example setup failed\n");
		return XST_FAILURE;
	}
	status =  xconvSetupInterrupt();
	if(status != XST_SUCCESS){
		print("Error: interrupt setup failed\n");
		return XST_FAILURE;
	}
	//XConv_accel_core_SetVal1(&xconv_dev,val1);
	//XConv_accel_core_SetVal2(&xconv_dev,val2);
	xconvStart(&xconv_dev);

	return 0;
}

int Run_HW_Accelerator(float image[NUM_FEATURES_1][IMAGE_SIZE_1][IMAGE_SIZE_1], float filter[NUM_FILTERS_1][NUM_FEATURES_1][FILTER_SIZE_1][FILTER_SIZE_1], float bias[NUM_FILTERS_1], float feature_map[NUM_FILTERS_1][OUTPUT_SIZE_1][OUTPUT_SIZE_1], int dma_size)
{
	// DMA NUMBER
	unsigned int DMA_IMAGE=NUM_FEATURES_1*IMAGE_SIZE_1*IMAGE_SIZE_1*sizeof(float);
	unsigned int DMA_FILTER=NUM_FILTERS_1*NUM_FEATURES_1*FILTER_SIZE_1*FILTER_SIZE_1*sizeof(float);
	unsigned int DMA_BIAS=NUM_FILTERS_1*sizeof(float);
	unsigned int DMA_FEATUREMAP=NUM_FILTERS_1*OUTPUT_SIZE_1*OUTPUT_SIZE_1*sizeof(float);
	//transfer A to the Vivado HLS block
	int status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) image, DMA_IMAGE, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//transfer B to the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) filter, DMA_FILTER, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer to Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//get results from the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) bias, DMA_BIAS, XAXIDMA_DMA_TO_DEVICE);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer from Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//get results from the Vivado HLS block
	status = XAxiDma_SimpleTransfer(&AxiDma, (unsigned int) feature_map, DMA_FEATUREMAP,XAXIDMA_DEVICE_TO_DMA);
	if (status != XST_SUCCESS) {
		//print("Error: DMA transfer from Vivado HLS block failed\n");
		return XST_FAILURE;
	}
	/* Wait for transfer to be done */
	while (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE)) ;

	//poll the DMA engine to verify transfers are complete
	/* Waiting for data processing */
	/* While this wait operation, the following action would be done
	 * First: Second matrix will be sent.
	 * After: Multiplication will be compute.
	 * Then: Output matrix will be sent from the accelerator to DDR and
	 * it will be stored at the base address that you set in the first SimpleTransfer
	 */
	while ((XAxiDma_Busy(&AxiDma, XAXIDMA_DEVICE_TO_DMA)) || (XAxiDma_Busy(&AxiDma, XAXIDMA_DMA_TO_DEVICE))) ;

//	while (!ResultExample)
//		print("Waiting for core to finish\n\r");

	return 0;

}
