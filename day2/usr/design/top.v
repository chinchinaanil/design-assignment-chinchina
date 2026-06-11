module u_sr(
    input clk,
    input [1:0] sel,
    input sin_r,
    input sin_l,
    input [3:0] d,
    output reg [3:0] q
);

always @(posedge clk)
begin
    case(sel)
        2'b00: q <= q;                          // Hold
        2'b01: q <= {sin_r, q[3:1]};            // Shift Right
        2'b10: q <= {q[2:0], sin_l};            // Shift Left
        2'b11: q <= d;                          // Parallel Load
    endcase
end

endmodule
