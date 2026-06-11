module seq_1110_overlap_tb;

reg clk;
reg rst;
reg x;
wire y;

seq_1110_overlap uut(
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    rst = 1;
    #10 rst = 0;

    // Input sequence: 11101110
    x = 1; #10;
    x = 1; #10;
    x = 1; #10;
    x = 0; #10;  // Detect

    x = 1; #10;
    x = 1; #10;
    x = 1; #10;
    x = 0; #10;  // Detect again

    $finish;
end

endmodule
