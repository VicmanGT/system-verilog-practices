// Code your testbench here
// or browse Examples
module prime_number_tb;
  logic a, b, c, d, f;
  
  // change name of module depending on which one is to test
  prime_number_g dut(
    .a(a), 
    .b(b), 
    .c(c), 
    .d(d), 
    .f(f)
  );
  
  initial 
    begin 
      $dumpfile("dump.vcd");
      $dumpvars(0, dut);
      
      a = 0; b = 0; c = 0; d = 0; #3;
      a = 0; b = 0; c = 0; d = 1; #3;
      a = 0; b = 0; c = 1; d = 0; #3;
      a = 0; b = 0; c = 1; d = 1; #3;
      a = 0; b = 1; c = 0; d = 0; #3;
      a = 0; b = 1; c = 0; d = 1; #3;
      a = 0; b = 1; c = 1; d = 0; #3;
      a = 0; b = 1; c = 1; d = 1; #3;
      
      a = 1; b = 0; c = 0; d = 0; #3;
      a = 1; b = 0; c = 0; d = 1; #3;
      a = 1; b = 0; c = 1; d = 0; #3;
      a = 1; b = 0; c = 1; d = 1; #3;
      a = 1; b = 1; c = 0; d = 0; #3;
      a = 1; b = 1; c = 0; d = 1; #3;
      a = 1; b = 1; c = 1; d = 0; #3;
      a = 1; b = 1; c = 1; d = 1; #3;
      
      a = 0; b = 0; c = 0; d = 0; #3;
      $finish;
      
      end
endmodule
      
   