// Code your testbench here
// or browse Examples
module RCA_tb;
  reg [4:0] p, q;
  reg cin;
  wire [5:0] r;
  
  RCA dut(
    .p(p), 
    .q(q), 
    .cin(cin), 
    .r(r));
  
  initial
  	begin
      //Generar formas de onda para visualización
      $dumpfile("dump.vcd");
      $dumpvars(0, dut); 
      
      //Casos
      p = 5'b10000; q = 5'b10000; cin = 1; #5;
      p = 5'b00010; q = 5'b00111; cin = 0; #5;
      p = 5'b01100; q = 5'b00110; cin = 0; #5;
      p = 5'b01101; q = 5'b01101; cin = 0; #5;
      p = 5'b10101; q = 5'b10001; cin = 0; #5;
      p = 5'b11111; q = 5'b11110; cin = 1; #5;
      $finish;
  end
endmodule
