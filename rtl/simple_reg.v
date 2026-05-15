module simple_reg (
    input  wire        clk,
    input  wire [31:0] din,
    output reg  [31:0] dout
);

always @(posedge clk)
    dout <= din;

endmodule