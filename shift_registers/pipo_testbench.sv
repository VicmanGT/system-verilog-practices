module pipo_tb;
    logic clk;
    logic rst; // Added reset signal
    logic [7:0] data_in; 
    logic load; 
    logic [7:0] outupt;
    
    pipo dut (
        .clk(clk), 
        .rst(rst), // Connect reset
        .data_in(data_in), 
        .load(load), 
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
            load = 0; #5;
            rst = 0; // Deassert reset
            
            // Test sequence
            data_in = 8'b10101010; load = 1; #10; // Load first byte
            load = 0; #20;
            
            data_in = 8'b11001100; load = 1; #10; // Load second byte
            load = 0; #20;
            
            data_in = 8'b11110000; load = 1; #10; // Load third byte
            load = 0; #20;

            #20;
            $finish;
        end

endmodule