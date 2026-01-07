module uart_tx 
(
    input clk,
    input start,
    input [7:0] data,
    output reg tx,
    output reg busy
);

reg [3:0] bit_count;
reg [9:0] shift_reg;

always @(posedge clk) begin
    if (start && !busy) begin
        shift_reg <= {1'b1, data, 1'b0}; // stop, data, start
        bit_count <= 0;
        busy <= 1;
    end else if (busy) begin
        tx <= shift_reg[0];
        shift_reg <= shift_reg >> 1;
        bit_count <= bit_count + 1;
        if (bit_count == 9)
            busy <= 0;
    end
end

endmodule
