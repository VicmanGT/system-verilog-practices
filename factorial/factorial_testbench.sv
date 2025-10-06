// Code your testbench here
// or browse Examples
module factorial_testbench;
  logic [4:0] n;
  logic [31:0] fact;
  
  initial
    begin 
      $dumpfile("dump.vcd");
      $dumpvars(0, factorial_testbench); 
      
      // sum
      n = 4'b0001; calculate_factorial(n, fact); #3;
      n = 4'b1001; calculate_factorial(n, fact); #3;
      n = 4'b0011; calculate_factorial(n, fact); #3;
      n = 4'b1011; calculate_factorial(n, fact); #3;
      n = 4'b0001; calculate_factorial(n, fact); #3;
      
      #3; $finish;
      end
endmodule

      