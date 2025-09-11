// Code your design here
module prime_number_ca (
  input a, b, c, d,
  output f
);
   assign f = !a && !b && c || !a && b && d || b && !c && d || !b && c && d;
    
endmodule

module prime_number_g (
  input a, b, c, d, 
  output f
);
  logic a_, b_, c_, and1, and2, and3, and4;
  
  not(a_, a);
  not(b_, b); 
  not(c_, c);
  not(d_, d); 
  
  and(and1, a_, b_, c);
  and(and2, a_, b, d);
  and(and3, b, c_, d);
  and(and4, b_, c, d);
  
  or(f, and1, and2, and3, and4);
  
endmodule