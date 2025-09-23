module siso_tb;
  logic clk;
  logic rst; // Added reset signal
  logic data_in; 
  logic load; 
  logic data_out;
  
  siso dut (
    .clk(clk), 
    .rst(rst), // Connect reset
    .data_in(data_in), 
    .load(load), 
    .data_out(data_out)
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
      rst = 1; // Assert reset
      load = 0; #5;
      rst = 0; // Deassert reset
      
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