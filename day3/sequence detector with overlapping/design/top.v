module seq_1110_overlap(
    input clk,
    input rst,
    input x,
    output reg y
);

reg [2:0] state;

parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b011;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= S0;
        y <= 0;
    end
    else
    begin
        case(state)

        S0: begin
            y <= 0;
            if(x)
                state <= S1;
            else
                state <= S0;
        end

        S1: begin
            y <= 0;
            if(x)
                state <= S2;
            else
                state <= S0;
        end

        S2: begin
            y <= 0;
            if(x)
                state <= S3;
            else
                state <= S0;
        end

        S3: begin
            if(x)
            begin
                state <= S3;   // overlap support
                y <= 0;
            end
            else
            begin
                state <= S0;
                y <= 1;        // sequence 1110 detected
            end
        end

        default: begin
            state <= S0;
            y <= 0;
        end

        endcase
    end
end

endmodule
