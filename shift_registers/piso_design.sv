module piso (
    input clk,        // Clock signal
    input rst,        // Reset signal (active high)
    input [7:0] data_in, // Parallel input data
    input load,
    output logic data_out // Serial output data
);
    reg [7:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 8'b0;
        else if (load)
            shift_reg <= data_in;  // Load parallel data into the shift register
        else
            shift_reg <= {shift_reg[6:0], 1'b0};  // Shift right and fill with 0
    end

    assign data_out = shift_reg[7];  // Serial output is the first bit of the register
endmodule