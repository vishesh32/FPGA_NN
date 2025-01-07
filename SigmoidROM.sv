module SigmoidROM #(
    parameter ADDR_WIDTH = 10,            
    parameter DATA_WIDTH = 16           
    parameter STRING SIG_FILE = ""  

)(
    input                    clk,           
    input   [ADDR_WIDTH-1:0] sig_in,            
    output  [DATA_WIDTH-1:0] sig_out       
);

    reg [DATA_WIDTH-1:0] sig_mem [2**ADDR_WIDTH-1:0];    // Memory array to hold ROM data
    reg [ADDR_WIDTH-1:0] addr;                       // Address register for signed lookup

    initial begin
        $readmem(SIG_FILE, sig_mem);  
    end


    always @(posedge clk) begin

        if ($signed(sig_in) >= 0)
            addr <= sig_in + (2**(ADDR_WIDTH-1));  // For positive values of 'sig_in', adjust by offset
        else
            addr <= sig_in - (2**(ADDR_WIDTH-1));  // For negative values of 'sig_in', adjust by offset
    end

    assign sig_out = sig_mem[addr]; 

endmodule
