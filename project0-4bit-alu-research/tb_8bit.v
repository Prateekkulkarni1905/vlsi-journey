`timescale 1ns/1ps
module ALU_8bit_TB;
  reg [7:0]A,B;
  reg [2:0]opcode;
  wire [7:0]out;
  
  ALU_8bit uut( .A(A), .B(B), .opcode(opcode), .out(out) );
  
  initial begin
    $dumpfile("ALU_8bit.vcd");
    $dumpvars(0,ALU_8bit_TB);
    
    //Test 1 addition
    opcode=3'b000;A=8'd250; B=8'd13;#10
    
    //Test 2 subtraction 
    opcode=3'b001;#10
    
    //Test 3 AND
    opcode=3'b010;#10
    
    //Test 4 OR
    opcode=3'b011;#10
    
    //Test 5 XOR
    opcode=3'b100;#10
    
    //Test 6 Shift to Left
    opcode=3'b101;#10
    
    //Test 7 Shift to Right
    opcode=3'b110;#10
    
    //Test 8 Compare
    opcode=3'b111;#10
    
    $display("8 Bit ALU Behavioural Style coding");
    $finish;
    
  end
  
  initial begin
    $monitor("t=%0t |opcode=%b A=%b B=%b | out=%b carry=%b zero=%b ",$time,opcode,A,B,out,uut.carry,uut.zero);
  end
endmodule