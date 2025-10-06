module bidirectional_shift_reg_tb;
    logic clk;
    logic rst; // Added reset signal
    logic data_in; 
    logic load; 
    logic dir; // Direction control
    logic [7:0] outupt;
    
    bidirectional_shift_reg dut (
        .clk(clk), 
        .rst(rst), // Connect reset
        .data_in(data_in), 
        .load(load), 
        .dir(dir), // Connect direction
        .data_out(outupt)
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
            load = 0; dir = 0; #5;
            rst = 0; // Deassert reset
            
            // Test sequence
            data_in = 1; load = 1; dir = 0; #10; // Load first bit, shift left
            load = 0; #20;
            
            data_in = 0; dir = 0; #10; // Shift left with new bit
            data_in = 1; #10;
            data_in = 1; #10;
            data_in = 0; #10;
            
            dir = 1; #10; // Change direction to right
            data_in = 1; #10;
            data_in = 0; #10;
            data_in = 0; #10;

            load = 1; dir = 0; data_in = 1; #10; // Load new bit while shifting left
            load = 0; #20;

            #20;
            $finish;
        end

endmodule
