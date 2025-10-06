// Code your testbench here

module tb_control_arm;
    logic clk;
    logic rst_n;

    logic [1:0] op_code;
    logic [3:0] coord_x;
    logic [3:0] coord_y;
    logic [2:0] angle;

    logic [7:0] motor_ctrl;
    logic signed [4:0] position;

    control_arm dut (
        .clk(clk), 
      	.rst_n(rst_n),
        .op_code(op_code), 
      	.coord_x(coord_x), 
      	.coord_y(coord_y), 
      	.angle(angle),
        .motor_ctrl(motor_ctrl), 
      	.position(position)
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
        
      	rst_n = 0; op_code = 2'b00; coord_x = 4'b0000;
        coord_y = 4'b0000; angle = 3'b000;
      	#10;
        rst_n = 1;
        #10;

        // resting
        op_code = 2'b00; coord_x = 4'b0101; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;
        op_code = 2'b00; coord_x = 4'b1111; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;

        // move
        op_code = 2'b01; coord_x = 4'b0011; 
        coord_y = 4'b0100; angle = 3'b000;
        #20;
        op_code = 2'b01; coord_x = 4'b0101; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;
        op_code = 2'b01; coord_x = 4'b1111; 
        coord_y = 4'b1111; angle = 3'b000;
        #20;
        
        // rotate
        op_code = 2'b10; coord_x = 4'b0000; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;
        op_code = 2'b10; coord_x = 4'b0101; 
        coord_y = 4'b0000; angle = 3'b011;
        #20;
        op_code = 2'b10; coord_x = 4'b1111; 
        coord_y = 4'b0000; angle = 3'b111;
        #20;
        
         // calibrate
        op_code = 2'b11; coord_x = 4'b0000; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;
        op_code = 2'b11; coord_x = 4'b0101; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;
        op_code = 2'b11; coord_x = 4'b1111; 
        coord_y = 4'b0000; angle = 3'b000;
        #20;
        
        #20;
        $finish;
    end

endmodule
