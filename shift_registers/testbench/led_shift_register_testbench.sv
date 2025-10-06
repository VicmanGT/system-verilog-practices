// Code your testbench here
// or browse Examples

module led_control_tb;
  logic clk;
  logic data_in; 
  logic load; 
  logic [7:0] leds;
  
  siso dut (
    .clk(clk), 
    .data_in(data_in), 
    .load(load), 
    .data_out_sipo(leds)
  );
  initial 
    begin 
      clk = 0;
      forever #5 clk = ~clk;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, dut);
      load = 0; #5;
      
      // byte filling
      data_in = 0; #70;
      
      data_in =1; #10;
      data_in =0; #10;
  	  data_in =1; #10;
      data_in =0; #10;
      data_in =1; #10;
      data_in =0; #10;
      data_in =1; #30;
      load =1; #10;
      data_in = 0; load = 0; #10;
      data_in =1; #10;
      data_in =1; #10;
      data_in =1; #10;
      data_in =1; load = 1; #10;
      data_in =0; load = 0; #10;
      data_in =0; #10;
      data_in =0; #10;
      data_in =0; #10;
      load = 1; #10;
      load = 0; #10;
      #20;
      $finish;
      
    end
endmodule
      