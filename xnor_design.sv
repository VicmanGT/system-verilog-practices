// Code your design here
module Xnor2(
    input  wire x,
    input  wire y,
    output wire z
);
  assign z = x ~^ y;
endmodule
