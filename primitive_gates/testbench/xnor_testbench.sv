// Code your testbench here
`timescale 1ns/1ps

module Xor2_tb;
  reg x, y;
  wire z;
  
  // Instantiate DUT with named ports
  Xnor2 dut (
    .x(x),
    .y(y),
    .z(z)
  );
  
  initial begin
      $monitor("Time=%0t x=%b y=%b z=%b", $time, x, y, z);
      $dumpfile("dump.vcd");
      $dumpvars(0, dut);
      x = 0; y = 0; #5;
      x = 0; y = 1; #5;
      x = 1; y = 0; #5;
      x = 1; y = 1; #5;
      #5 $finish;
  end
endmodule
