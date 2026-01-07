module traffic_light_controller 
(
    input clk,
    input reset,
    output reg red,
    output reg yellow,
    output reg green
);

typedef enum reg [1:0] {RED, GREEN, YELLOW} state_t;
state_t state;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= RED;
    else begin
        case (state)
            RED:    state <= GREEN;
            GREEN:  state <= YELLOW;
            YELLOW: state <= RED;
        endcase
    end
end

always @(*) begin
    red = (state == RED);
    green = (state == GREEN);
    yellow = (state == YELLOW);
end

endmodule
