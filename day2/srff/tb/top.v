module sr_ff_tb;

reg clk;
reg s;
reg r;
wire q;

sr_ff uut(
    .clk(clk),
    .s(s),
    .r(r),
    .q(q)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    s = 0; r = 0; #10;   // No Change
    s = 1; r = 0; #10;   // Set
    s = 0; r = 1; #10;   // Reset
    s = 1; r = 1; #10;   // Invalid
    s = 0; r = 0; #10;   // No Change

    $finish;
end

initial
begin
    $monitor("Time=%0t S=%b R=%b Q=%b", $time, s, r, q);
end

endmodule
