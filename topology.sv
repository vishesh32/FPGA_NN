`define NUM_LAYERS           5     

`define DATA_WIDTH           31    

`define LAYER_1_NUM_NEURONS  30   
`define LAYER_1_NUM_WEIGHTS  784   
`define LAYER_1_ACTIVATION_TYPE "sigmoid" 

`define LAYER_2_NUM_NEURONS  30    
`define LAYER_2_NUM_WEIGHTS  30    
`define LAYER_2_ACTIVATION_TYPE "sigmoid" 

`define LAYER_3_NUM_NEURONS  10    
`define LAYER_3_NUM_WEIGHTS  30    
`define LAYER_3_ACTIVATION_TYPE "sigmoid" 

`define LAYER_4_NUM_NEURONS  10    
`define LAYER_4_NUM_WEIGHTS  10    
`define LAYER_4_ACTIVATION_TYPE "sigmoid" 

`define LAYER_5_NUM_NEURONS  10    
`define LAYER_5_NUM_WEIGHTS  10    
`define LAYER_5_ACTIVATION_TYPE "hardmax" 

// Additional configuration for specific activation function sizes or weight bit-widths
`define SIGMOID_SIZE         5     // Size for the sigmoid function (perhaps bit-width for sigmoid output)
`define WEIGHT_INT_WIDTH     1     // Integer width of weights (bit-width for weight storage)
