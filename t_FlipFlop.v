module t_flip_flop(clk,reset,t,q);
    input clk;
    input reset;
    input t;
    output reg q;


    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (t)
            q <= ~q;
    end

endmodule
