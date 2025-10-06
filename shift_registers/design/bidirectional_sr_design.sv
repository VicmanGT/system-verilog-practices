module bidirectional_shift_reg (
    input clk,        // Clock signal
    input rst,        // Reset signal (active high)
    input data_in,    // Serial input data
    input load,
    input dir,       // Direction control: 0 for left, 1 for right
    output logic [7:0] data_out // Parallel output data
);
    reg [7:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 8'b0;
        else if (dir == 0)
            shift_reg <= {data_in, shift_reg[7:1]};  // Shift right and input new data
        else
            shift_reg <= {shift_reg[6:0], data_in};  // Shift left and input new data
    end

    assign data_out = shift_reg;  // Parallel output is the entire shift register content
endmodule
