// Code your testbench here
// or browse Examples
module alu_testbench;
  logic [7:0] a, b;
  logic [1:0] op;
  logic [7:0] result; 
  logic overflow_flag;
  
  alu dut(
    .a(a), 
    .b(b), 
    .op(op), 
    .result(result), 
    .overflow_flag(overflow_flag)
  );
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars(0, dut); 
      
      op = `NOP; a = 8'b0; b = 8'b0; #5;
      
      a = 8'b00010101; b = 8'b00010101; #5;
      
      a = 8'b11111111; b = 8'b11111111; #5;
      
      op = `ADDI; a = 8'b00010101; b = 8'b00010101; #5;
      
      a = 8'b11111111; b = 8'b11111111; #5;
      
      op = `MULTI; a = 8'b00010101; b = 8'b00010101; #5;
      
      a = 8'b11111111; b = 8'b11111111; #5;
      
      op = `NOP; a = 8'b0; b = 8'b0; #5;
      
      #5;
    end
      
endmodule
  