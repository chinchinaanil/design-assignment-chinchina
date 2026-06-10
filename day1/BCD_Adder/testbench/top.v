`timescale 1ns/1ps

module bcdadd_tb;

reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;

// Instantiate the BCD adder
bcdadd uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    // Monitor the outputs
    $monitor("Time=%0t a=%d b=%d cin=%b -> sum=%d cout=%b",
              $time, a, b, cin, sum, cout);

    // Test Case 1: 5 + 3 = 8
    a = 4'd5; b = 4'd3; cin = 0;
    #10;

    // Test Case 2: 5 + 7 = 12
    a = 4'd5; b = 4'd7; cin = 0;
    #10;

    // Test Case 3: 9 + 9 = 18
    a = 4'd9; b = 4'd9; cin = 0;
    #10;

    // Test Case 4: 4 + 5 + 1 = 10
    a = 4'd4; b = 4'd5; cin = 1;
    #10;

    // Test Case 5: 2 + 6 = 8
    a = 4'd2; b = 4'd6; cin = 0;
    #10;

    $finish;
end

endmodule

