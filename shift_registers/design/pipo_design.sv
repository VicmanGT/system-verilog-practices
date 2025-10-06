module pipo (
    input clk,        // Clock signal
    input rst,        // Reset signal (active high)
    input [7:0] data_in, // Parallel input data
    input load,
    output logic [7:0] data_out // Parallel output data
);
    reg [7:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst)
            shift_reg <= 8'b0;
        else if (load)
            shift_reg <= data_in;  // Load parallel data into the shift register
    end

    assign data_out = shift_reg;  // Parallel output is the entire shift register content
endmodule