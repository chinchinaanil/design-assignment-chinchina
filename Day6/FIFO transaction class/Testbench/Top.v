class fifo_transaction;

  // FIFO Inputs
  rand bit        wr_en;
  rand bit        rd_en;
  rand bit [7:0]  din;

  // FIFO Outputs
  bit [7:0] dout;
  bit       full;
  bit       empty;

  // Constraint: avoid read and write together
  constraint c1 {
    !(wr_en && rd_en);
  }

  // Display Method
  function void display();
    $display("wr_en=%0b rd_en=%0b din=%0h dout=%0h full=%0b empty=%0b",
              wr_en, rd_en, din, dout, full, empty);
  endfunction

endclass
