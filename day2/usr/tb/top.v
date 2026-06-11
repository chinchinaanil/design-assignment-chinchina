module u_sr_tb(

    );
   
reg clk;
reg [1:0] sel;
reg sin_r, sin_l;
reg [3:0] d;
wire [3:0] q;

u_sr uut(
    .clk(clk),
    .sel(sel),
    .sin_r(sin_r),
    .sin_l(sin_l),
    .d(d),
    .q(q)
);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    // Parallel Load
    sel = 2'b11;
    d = 4'b1010;
    #10;

    // Shift Right
    sel = 2'b01;
    sin_r = 1'b1;
    #10;

    // Shift Left
    sel = 2'b10;
    sin_l = 1'b0;
    #10;

    // Hold
    sel = 2'b00;
    #10;

    $finish;
end

endmodule

