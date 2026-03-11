// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module eight_bit_reg_tb;
  reg clk,rst,load;
  reg [7:0]d;
  wire [7:0]q;
  
  eight_bit_reg uut( .clk(clk), .rst(rst), .load(load), .d(d), .q(q) );
  
  initial clk=0;
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("eight_bit_reg.vcd");
    $dumpvars(0,eight_bit_reg_tb);
    
    //Test 1 reset
    rst=1;#20;
    
    //Test 2 load it
    rst=0; load=1; d={8{1'b1}};#20;
    
    //Test 3 hold
    load=0; #20;
    
    //Test 4 reload 
    load=1; d=8'd5;#20;
    
    $display("8 bit register Completed");
    $finish;
    
  end
  
  initial begin
    $monitor("t=%0t | rst=%b load=%b d=%b | q=%b",$time,rst,load,d,q);
  end
endmodule
