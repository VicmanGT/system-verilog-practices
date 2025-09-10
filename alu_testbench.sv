// Code your testbench here
// or browse Examples
module alu_testbench;
  logic [7:0] a, b;
  logic [1:0] op;
  logic [15:0] result;
  logic error, zero_flag;
  
  alu_complete dut(
    .a(a), 
    .b(b), 
    .op(op), 
    .result(result), 
    .error(error), 
    .zero_flag(zero_flag)
  );
  initial
    begin 
      $dumpfile("dump.vcd");
      $dumpvars(0, dut); 
      
      // sum
      a = 8'b00010101; b = 8'b00010101; op=2'b00; #3;
      a = 8'b01010101; b = 8'b00100001; op=2'b00; #3;
      a = 8'b11110101; b = 8'b10101101; op=2'b00; #3;
      // sub 
      a = 8'b00010101; b = 8'b00010101; op=2'b01; #3;
      a = 8'b01010101; b = 8'b00100001; op=2'b01; #3;
      a = 8'b11110101; b = 8'b10101101; op=2'b01; #3;
      // mult 
      a = 8'b00010101; b = 8'b00010101; op=2'b10; #3;
      a = 8'b01010101; b = 8'b00100001; op=2'b10; #3;
      a = 8'b11110101; b = 8'b10101101; op=2'b10; #3;
      // div 
      a = 8'b00010101; b = 8'b00010101; op=2'b11; #3;
      a = 8'b01010101; b = 8'b00100001; op=2'b11; #3;
      a = 8'b11110101; b = 8'b10101101; op=2'b11; #3;
      a = 8'b11110101; b = 8'b00000000; op=2'b11; #3;
      
      
      a = 8'b00010101; b = 8'b00010101; op=2'b00; #3;
      
      
      #3; $finish;
      end
endmodule

      