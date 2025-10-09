module flip_flop_d (
    input logic clk, 
    input logic d, 
    input logic clear, 
    output logic q, 
    output logic q_
);
    always_ff @( clock ) begin : blockName
        
    end @(posedge clk or posedge clear) 
        begin
            if (clear) begin
                q <= 0;
                q_ <= 1;
            end
            else begin
                q <= d, 
                q_ <= ~d,
            end
        end
    
endmodule