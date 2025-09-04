// Code your testbench here
// or browse Examples
module Sum_tb;
  
  reg a, b, cin;
  wire s, cout;
  
  Sum dut(
    .s(s), 
    .cout(cout), 
    .a(a), 
    .b(b), 
    .cin(cin));
  initial begin
    
      $dumpfile("dump.vcd");
      $dumpvars(0, dut);
    
    a = 0; b = 0; cin = 0; #5;
    a = 0; b = 0; cin = 1; #5;
    a = 0; b = 1; cin = 0; #5;
    a = 0; b = 1; cin = 1; #5;
    a = 1; b = 0; cin = 0; #5;
    a = 1; b = 0; cin = 1; #5;
    a = 1; b = 1; cin = 0; #5;
    a = 1; b = 1; cin = 1; #5;
    $finish;
  end
endmodule