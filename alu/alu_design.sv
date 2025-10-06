  // Code your design here
  // Función para suma 

  module alu_complete (
    input logic [7:0] a, 
    input logic [7:0] b, 
    input logic [1:0] op,
    output logic [15:0] result, 
    output logic error, 
    output logic zero_flag);

    function automatic logic [8:0] sum(input logic [7:0] x, input logic [7:0] y);
    return {1'b0, x} + {1'b0, y};
  endfunction

  function automatic logic [8:0] sub(input logic [7:0] x, input logic [7:0] y);
    if (x == y) begin
      zero_flag = 1'b1;
      return 0;
    end
    return {1'b0, x} - {1'b0, y};
  endfunction

  function automatic logic [8:0] mult(input logic [7:0] x, input logic [7:0] y);
    return {1'b0, x} * {1'b0, y};
  endfunction

  function automatic logic [8:0] div(input logic [7:0] x, input logic [7:0] y, output logic error);
    if (y == 0) begin
      error = 1'b1;
      return 16'hFFFF;
    end
    error = 1'b0;
    return {1'b0, x} / {1'b0, y};
  endfunction

    always_comb 
      begin 
      zero_flag = 1'b0;
      result = 16'd0;
      error = 1'b0;
    if (op == 2'b00) begin
      result = sum(a, b); 
    end
    else if (op == 2'b01) begin
      result = sub(a, b);
    end
    else if (op == 2'b10) begin
      result = mult(a, b);
    end
    else if (op == 2'b11) begin

      result = div(a, b, error);
    end

      end

   endmodule


