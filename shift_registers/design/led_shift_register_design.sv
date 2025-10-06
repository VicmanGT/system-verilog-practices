// Code your design here

module sipo (
    input clk,        // Clock signal
    input data_in,    // Serial input data
    input load, 
  	output logic [7:0] data_out // Parallel output data
);
  	reg [7:0] shift_reg;

    always @(posedge clk) begin
          shift_reg <= {data_in, shift_reg[7:1]};  // Shift left and input new data
      if (load)
    	 data_out <= shift_reg;  // Parallel output is the entire shift register co
    end
  
endmodule

module siso (
    input clk,      // Clock signal
    input data_in,  // Serial input data
  	input load,
    output logic data_out,
  	output logic [7:0] data_out_sipo
);
  reg [7:0] shift_reg;  // 8-bit shift register
  
  sipo u_sipo(
    .clk(clk),
    .load(load),
    .data_in(data_out), 
    .data_out(data_out_sipo)
  );

    always @(posedge clk) begin
         shift_reg <= {data_in, shift_reg[7:1]};  // Shift left and add new data
    end

  assign data_out = shift_reg[0];  // Serial output is the last bit of the register
endmodule


  
  