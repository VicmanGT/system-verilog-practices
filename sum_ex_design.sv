// Code your design here
module Sum(output wire s, cout, input wire a, b, cin);
  assign s = a^b^cin;
  assign cout = a&b | a&cin | b&cin;
  
 endmodule

    