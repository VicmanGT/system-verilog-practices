// Code your design here

module decoder_2to4 (
    input  logic [1:0] in,
    output logic [3:0] out
);
    always_comb begin
        out = 4'b0000;
        case (in)
            2'b00: out = 4'b0001; //resting   
            2'b01: out = 4'b0010; //move
            2'b10: out = 4'b0100; // rotate
            2'b11: out = 4'b1000; // calibrate
            default: out = 4'b0000;
        endcase
    end
endmodule


module mode_mux (
    input  logic [1:0] op_code,
    input  logic [3:0] coord_x,
    input  logic [3:0] coord_y,
    input  logic [2:0] angle,
    output logic signed [4:0] mux_out  
);

    always_comb begin
        case (op_code)
          2'b00: mux_out = $signed({coord_x[3], coord_x}); //resting    
          2'b01: mux_out = $signed({coord_y[3], coord_y}); //move
          2'b10: mux_out = $signed({2'b00, angle}); //rotate               
          2'b11: mux_out = $signed(5'd10); //calibrate       
            default: mux_out = 5'sd0;
        endcase
    end
endmodule


// -------------- signed_adder --------------
module signed_adder (
  	input  logic signed [4:0] a,
    input  logic signed [4:0] b,  
    output logic signed [4:0] sum 
);
   
    always_comb begin
        sum = a + b;
    end
endmodule

module control_arm (
    input  logic         clk,
    input  logic         rst_n,
    input  logic [1:0]   op_code,    
    input  logic [3:0]   coord_x,
    input  logic [3:0]   coord_y,
    input  logic [2:0]   angle,
    output logic [7:0]   motor_ctrl, 
    output logic signed [4:0] position 
);
    
    logic [3:0] decoder_out;
    logic signed [4:0] mux_out;
    logic signed [4:0] coord_x_s; 
    logic signed [4:0] sum_out;

    decoder_2to4 u_dec(
      .in(op_code), 
      .out(decoder_out)
    );
  
    mode_mux u_mux(
      .op_code(op_code), 
      .coord_x(coord_x), 
      .coord_y(coord_y), 
      .angle(angle), 
      .mux_out(mux_out)
    );

    always_comb coord_x_s = $signed({coord_x[3], coord_x});

    signed_adder u_adder(
      .a(mux_out), 
      .b(coord_x_s), 
      .sum(sum_out)
    );

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            position <= 5'sd0;
        end else begin
            position <= sum_out;
        end
    end

    always_comb begin
        motor_ctrl = 8'd0;
      
        motor_ctrl[5]    = decoder_out[1];
        motor_ctrl[3]    = decoder_out[1]; 
        motor_ctrl[4]    = decoder_out[2]; 
        motor_ctrl[2]    = decoder_out[0]; 
        motor_ctrl[1]    = decoder_out[3]; 
        motor_ctrl[0]    = decoder_out[2]; 
    end

endmodule


