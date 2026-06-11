module block_ram_8x8 (
    input wire clk,          // Clock signal
    input wire ena,          // Array Enable (RAM active when high)
    input wire wea,          // Write Enable (1 = Write, 0 = Read)
    input wire [2:0] addra,  // 3-bit Address bus (2^3 = 8 locations)
    input wire [7:0] dina,   // 8-bit Input Data bus
    output reg [7:0] douta   // 8-bit Output Data bus
);

    // Declare the 8x8 memory array (8 locations, each 8 bits wide)
    reg [7:0] ram [0:7];

    // Synchronous Read and Write operations
    always @(posedge clk) begin
        if (ena) begin
            if (wea) begin
                ram[addra] <= dina;  // Write operation
            end
            douta <= ram[addra];     // Read operation (Read-First behavior)
        end
    end

endmodule


