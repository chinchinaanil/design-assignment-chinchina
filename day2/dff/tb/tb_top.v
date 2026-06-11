module d_ff_tb;

reg clk;
reg d;
wire q;

d_ff uut (
    .clk(clk),
    .d(d),
    .q(q)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;   // Clock period = 10 ns
end

initial
begin
    d = 0; #10;
    d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    $finish;
end

initial
begin
    $monitor("Time=%0t clk=%b d=%b q=%b", $time, clk, d, q);
end

endmodule
