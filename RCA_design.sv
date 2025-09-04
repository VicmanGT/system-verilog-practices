// Code your design here
module full_adder(a, b, cin, s, cout);
  input a, b, cin; //declaration of the list of inputs
  output s, cout; //declaration of the list of outputs
  assign s = a^b^cin;
  assign cout = (a&b) | (a&cin) | (b&cin);
endmodule 

module RCA(p, q, cin, r);
  input [4:0] p,q; //Declaración de entradas 5 bits
  output [5:0] r; // Salida 5 bits + acarreo
  input cin;
  wire [3:0] carry; //Acarreo de salida 4 bits
  
  full_adder fa0(p[0], q[0], cin, r[0], carry[0]);
  full_adder fa1(p[1], q[1], carry[0], r[1], carry[1]);
  full_adder fa2(p[2], q[2], carry[1], r[2], carry[2]);
  full_adder fa3(p[3], q[3], carry[2], r[3], carry[3]);
  full_adder fa4(p[4], q[4], carry[3], r[4], r[5]);
  
endmodule 