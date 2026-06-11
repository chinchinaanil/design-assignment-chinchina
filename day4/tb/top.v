`timescale 1ns / 1ps

module tb_block_ram_8x8;

    // Inputs to the UUT (Unit Under Test)
    reg clk;
    reg ena;
    reg wea;
    reg [2:0] addra;
    reg [7:0] dina;

    // Outputs from the UUT
    wire [7:0] douta;

    // Instantiate the Unit Under Test (UUT)
    block_ram_8x8 uut (
        .clk(clk), 
        .ena(ena), 
        .wea(wea), 
        .addra(addra), 
        .dina(dina), 
        .douta(douta)
    );

    // Clock generation: 100 MHz clock (10ns period)
    always begin
        #5 clk = ~clk;
    end

    // Stimulus process
    initial begin
        // Initialize Inputs
        clk = 0;
        ena = 0;
        wea = 0;
        addra = 3'b000;
        dina = 8'h00;

        // Wait 20 ns for global reset stabilization
        #20;
        
        // ----------------------------------------
        // STEP 1: WRITE OPERATIONS
        // ----------------------------------------
        ena = 1; // Enable the RAM
        wea = 1; // Set to Write Mode
        
        // Write 8'hAA to Address 0
        addra = 3'b000; dina = 8'hAA;
        #10; // Wait 1 clock cycle
        
        // Write 8'hBB to Address 1
        addra = 3'b001; dina = 8'hBB;
        #10;
        
        // Write 8'hCC to Address 5
        addra = 3'b101; dina = 8'hCC;
        #10;

        // ----------------------------------------
        // STEP 2: READ OPERATIONS
        // ----------------------------------------
        wea = 0; // Switch to Read Mode (Keep ena = 1)
        
        // Read from Address 0 (Expected output: 8'hAA)
        addra = 3'b000;
        #10;
        
        // Read from Address 1 (Expected output: 8'hBB)
        addra = 3'b001;
        #10;
        
        // Read from Address 5 (Expected output: 8'hCC)
        addra = 3'b101;
        #10;
        
        // ----------------------------------------
        // STEP 3: DISABLE RAM TEST
        // ----------------------------------------
        ena = 0; // Disable RAM
        addra = 3'b000; // Try reading Address 0 while disabled
        #10;

        // End Simulation
        $finish;
    end
      
endmodule
