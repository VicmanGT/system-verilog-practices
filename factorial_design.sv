  // Code your design here

task automatic calculate_factorial;
  input [4:0] n;
  output [31:0] fact;
  begin 
    fact = 1;
    for (int i =1; i<=n; i++) begin
      fact = fact * i;
    end
  end
endtask
 