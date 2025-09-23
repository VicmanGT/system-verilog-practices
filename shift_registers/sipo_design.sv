module sipo (
    input clk,        // Clock signal
    input rst,        // Reset signal (active high)
    input data_in,    // Serial input data
    input load, 
    output logic [7:0] data_out // Parallel output data
);
    reg [7:0] shift_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 8'b0;
            data_out <= 8'b0;
        end else begin
            shift_reg <= {data_in, shift_reg[7:1]}; 
            if (load)
                data_out <= shift_reg;  // Parallel output is the entire shift register
        end
    end 
endmodule