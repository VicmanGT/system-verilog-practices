module piso_tb;
    logic clk;
    logic rst; // Added reset signal
    logic [7:0] data_in; 
    logic load; 
    logic data_out;
    
    piso dut (
        .clk(clk), 
        .rst(rst), // Connect reset
        .data_in(data_in), 
        .load(load), 
        .data_out(data_out)
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
            
            // Load parallel data
            data_in = 8'b10101010; load = 1; #10;
            load = 0; #10;

            // Shift out data serially
            #80;

            $finish;
        end

endmodule

