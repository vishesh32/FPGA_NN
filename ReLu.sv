module ReLu #(
    parameter DATA_WIDTH = 32

)(
    input                       clk,
    input [DATA_WIDTH-1:0]      x,
    output reg [DATA_WIDTH-1:0] out

);

always @(posedge clk)
begin
    if ($signed(x) > 0)
        out <= x;
    else
        out <= 0;
end
      
endmodule