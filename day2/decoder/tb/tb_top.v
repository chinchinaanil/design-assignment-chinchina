module tb_decoder_2to4;

reg [1:0] A;
wire [3:0] Y;

// Instantiate the decoder
decoder_2to4 DUT (
    .A(A),
    .Y(Y)
);

initial
begin
    A = 2'b00; #10;
    A = 2'b01; #10;
    A = 2'b10; #10;
    A = 2'b11; #10;

    $finish;
end

initial
begin
    $monitor("Time=%0t A=%b Y=%b", $time, A, Y);
end

endmodule
