// Code your design here
`include "opcode.sv"

module alu(
  input logic [7:0] a, b, 
  input logic [1:0] op, 
  output logic [7:0] result, 
  output logic overflow_flag
);
  
  function automatic logic checkUnsignedOverflow (
    input logic [7:0] Ain,Bin,SumIn);
    logic overflow;
      if(SumIn < Ain || SumIn < Bin)
        overflow = 1'b1;
      else
        overflow = 1'b0;  
    return overflow;
  endfunction 
  

  always_comb
    begin
            
      result = 8'b0;
      
      case(op)
        `NOP : begin
          result = 8'b0;
          overflow_flag = 1'b0;
        end
        `MULTI : begin
          result =  a *  b;
          overflow_flag = checkUnsignedOverflow(a, b, result);
        end
        `ADDI : begin
          result = a + b;
          overflow_flag = checkUnsignedOverflow(a, b, result);
        end
      endcase
          
    end
  
endmodule 