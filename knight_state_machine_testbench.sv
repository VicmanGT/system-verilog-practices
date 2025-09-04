// Code your testbench here
// or browse Examples
module knight_life_tb;
  logic adventure, courage, sword_sharpened, dragon;
  reg clock;
  logic quest_over;
  
  initial
    begin
      clock = 0;
      forever #1 clock = ~clock;
    end
  
  knight_life dut(
    .adventure(adventure), 
    .courage(courage), 
    .sword_sharpened(sword_sharpened), 
    .dragon(dragon), 
    .clock(clock),
    .quest_over(quest_over)
  );
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, dut);
      
      adventure = 0; courage = 0; sword_sharpened = 0; dragon = 0; #5;
      adventure = 1; courage = 0; sword_sharpened = 0; dragon = 0; #5;
      adventure = 1; courage = 0; sword_sharpened = 1; dragon = 0; #5;
      adventure = 1; courage = 0; sword_sharpened = 1; dragon = 0; #15;
      adventure = 1; courage = 1; sword_sharpened = 1; dragon = 0; #15;
      adventure = 1; courage = 1; sword_sharpened = 1; dragon = 0; #5;
      adventure = 1; courage = 1; sword_sharpened = 1; dragon = 1; #15;
      adventure = 1; courage = 1; sword_sharpened = 1; dragon = 0; #5;
      
      #5; $finish;
    end
endmodule