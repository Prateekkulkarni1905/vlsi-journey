// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module test_jk_ff;
  reg clk,j,k;
  wire q;
  jk_ff uut( .clk(clk), .j(j) , .k(k) , .q(q) );
  
  initial clk=0;
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("jk_ff.vcd");
    $dumpvars(0,test_jk_ff);
    
    //Test 1 Hold
    j=0; k=0;#20;
    
    //Test 2 Reset
    j=0; k=1; #20;
    
    //Test 3 Set
    j=1; k=0; #20;
    
    //Test 4 flipping q
    j=1; k=1; #20;
    
    //Test 5 Back to hold
    j=0; k=0; #20;
    
    $display("JK Test Completed");
    $finish;
    
  end
  
    initial begin
      $monitor("t=%0t | j=%b k=%b | q=%b",$time,j,k,q);
    end
endmodule
