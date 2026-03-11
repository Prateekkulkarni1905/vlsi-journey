// Code your testbench here
// or browse Examples
`timescale 1ns/1ps 
module t_ff_tb;
  reg clk,t,rst;
  wire q;
  
  t_ff uut( .clk(clk), .t(t), .rst(rst), .q(q) );
  
  initial clk=0;
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("t_ff.vcd");
    $dumpvars(0,t_ff_tb);
    
    //Test 1 reset
    rst=1;t=0;#20;
    
    //Test 2  flip
    rst=0;t=1;#20;
    
    //Test 3 hold
    t=0;#20;
    
    //Test 4 reset midway
    rst=1;t=1;#20;
    
    $display("T Flip Flop Completed");
    $finish;
  end
  
  initial begin 
    $monitor("t=%0t | rst=%b t=%b | q=%b",$time,rst,t,q);
  end
endmodule
