module siso (
    input clk,      // Clock signal
    input rst,      // Reset signal (active high)
    input data_in,  // Serial input data
    input load,
    output logic data_out
);
    reg [7:0] shift_reg;  // 8-bit shift register

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 8'b0;
        else
            shift_reg <= {data_in, shift_reg[7:1]}; 
    end

    assign data_out = shift_reg[0];  // Serial output is the last bit of the register
endmodule