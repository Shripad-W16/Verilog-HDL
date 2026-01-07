module alu_4bit 
(
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] sel,
    output reg [3:0] result,
    output reg carry
);

always @(*) begin
    carry = 0;
    case (sel)
        2'b00: {carry, result} = a + b;
        2'b01: {carry, result} = a - b;
        2'b10: result = a & b;
        2'b11: result = a | b;
        default: result = 4'b0000;
    endcase
end
endmodule
