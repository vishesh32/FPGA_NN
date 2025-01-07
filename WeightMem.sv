`include "topology.sv"

module WeightMem #(
    parameter INTEGER NUM_WEIGHTS = 3   ,           // Total number of weights (depth of memory)
    parameter INTEGER NUM_INPUTS = 5,            // Number of inputs per neuron
    parameter INTEGER NUM_NEURONS = 1,           // Number of neurons in the layer
    parameter INTEGER ADDR_WIDTH = 10,           // Width of the memory address
    parameter INTEGER DATA_WIDTH = 16,           // Width of each data element (weight)
    parameter STRING WEIGHT_FILE = ""  
)
(
    input   clk,                           
    input   write_enable,                 
    input   read_enable,                   
    input   [ADDR_WIDTH-1:0] write_addr,   
    input   [ADDR_WIDTH-1:0] read_addr,    
    input   [DATA_WIDTH-1:0] write_data,   

    output reg [DATA_WIDTH-1:0] read_data     
);

    reg [DATA_WIDTH-1:0] weight_mem [NUM_WEIGHTS-1:0]; // Instantiating mem to store weights

        initial begin
            $readmem(WEIGHT_FILE, weight_mem);
        end


    // On each positive clock edge, read weights if enabled
    always @(posedge clk) begin
        if (read_enable) begin
            read_data <= weight_mem[read_addr];
        end
    end

endmodule
