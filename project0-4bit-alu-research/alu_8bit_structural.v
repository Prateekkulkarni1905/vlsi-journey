

module full_adder(input A,input B,input cin, output sum, output carry);

  wire sum1,carry1,carry2,carry3;

  xor g1(sum1,A,B);
  xor g2(sum,sum1,cin);

  and c1(carry1,A,B);
  and c2(carry2,A,cin);
  and c3(carry3,B,cin);
  or  c4(carry,carry1,carry2,carry3);

endmodule


module ripple_carry_adder_8bit(input [7:0]A,input [7:0]B,input cin,output [7:0]result,output carry);

  wire c0,c1,c2,c3,c4,c5,c6;

  full_adder b0(.A(A[0]), .B(B[0]), .cin(cin), .sum(result[0]), .carry(c0));
  full_adder b1(.A(A[1]), .B(B[1]), .cin(c0), .sum(result[1]), .carry(c1));
  full_adder b2(.A(A[2]), .B(B[2]), .cin(c1), .sum(result[2]), .carry(c2));
  full_adder b3(.A(A[3]), .B(B[3]), .cin(c2), .sum(result[3]), .carry(c3));
  full_adder b4(.A(A[4]), .B(B[4]), .cin(c3), .sum(result[4]), .carry(c4));
  full_adder b5(.A(A[5]), .B(B[5]), .cin(c4), .sum(result[5]), .carry(c5));
  full_adder b6(.A(A[6]), .B(B[6]), .cin(c5), .sum(result[6]), .carry(c6));
  full_adder b7(.A(A[7]), .B(B[7]), .cin(c6), .sum(result[7]), .carry(carry));

endmodule


module _andfunction(input [7:0]A,input [7:0]B , output [7:0]_and);

  and(_and[0],A[0],B[0]);
  and(_and[1],A[1],B[1]);
  and(_and[2],A[2],B[2]);
  and(_and[3],A[3],B[3]);
  and(_and[4],A[4],B[4]);
  and(_and[5],A[5],B[5]);
  and(_and[6],A[6],B[6]);
  and(_and[7],A[7],B[7]);

endmodule


module _orfunction(input [7:0]A,input [7:0]B , output [7:0]_or);

  or(_or[0],A[0],B[0]);
  or(_or[1],A[1],B[1]);
  or(_or[2],A[2],B[2]);
  or(_or[3],A[3],B[3]);
  or(_or[4],A[4],B[4]);
  or(_or[5],A[5],B[5]);
  or(_or[6],A[6],B[6]);
  or(_or[7],A[7],B[7]);

endmodule


module _xorfunction(input [7:0]A,input [7:0]B , output [7:0]_xor);

  xor(_xor[0],A[0],B[0]);
  xor(_xor[1],A[1],B[1]);
  xor(_xor[2],A[2],B[2]);
  xor(_xor[3],A[3],B[3]);
  xor(_xor[4],A[4],B[4]);
  xor(_xor[5],A[5],B[5]);
  xor(_xor[6],A[6],B[6]);
  xor(_xor[7],A[7],B[7]);

endmodule


module shiftreg_left(input [7:0]A, output [7:0]shiftleft);

  assign shiftleft = {A[6:0],1'b0};

endmodule


module shiftreg_right(input [7:0]A, output [7:0]shiftright);

  assign shiftright = {1'b0,A[7:1]};

endmodule


module _compare(input [7:0]A, input [7:0]B, output [7:0]compare);

  wire [8:0] comp;

  xnor(comp[0],A[0],B[0]);
  xnor(comp[1],A[1],B[1]);
  xnor(comp[2],A[2],B[2]);
  xnor(comp[3],A[3],B[3]);
  xnor(comp[4],A[4],B[4]);
  xnor(comp[5],A[5],B[5]);
  xnor(comp[6],A[6],B[6]);
  xnor(comp[7],A[7],B[7]);

  and(comp[8],comp[0],comp[1],comp[2],comp[3],comp[4],comp[5],comp[6],comp[7]);

  assign compare = {7'b0000000, comp[8]};

endmodule


module mux(input [7:0]A,input [7:0]B,input [2:0]opcode,output [7:0]out,output carry);

  wire [7:0]temp_add,temp_sub,complement_B,shiftright,shiftleft,_and,_or,_xor,compare;
  wire carry_add,carry_sub;

  not(complement_B[0],B[0]);
  not(complement_B[1],B[1]);
  not(complement_B[2],B[2]);
  not(complement_B[3],B[3]);
  not(complement_B[4],B[4]);
  not(complement_B[5],B[5]);
  not(complement_B[6],B[6]);
  not(complement_B[7],B[7]);

  ripple_carry_adder_8bit add(.A(A), .B(B), .cin(1'b0), .result(temp_add), .carry(carry_add));
  ripple_carry_adder_8bit sub(.A(A), .B(complement_B), .cin(1'b1), .result(temp_sub), .carry(carry_sub));

  _andfunction and1(.A(A), .B(B), ._and(_and));
  _orfunction  or1(.A(A), .B(B), ._or(_or));
  _xorfunction xor1(.A(A), .B(B), ._xor(_xor));

  shiftreg_left  L1(.A(A), .shiftleft(shiftleft));
  shiftreg_right R1(.A(A), .shiftright(shiftright));

  _compare cmp(.A(A), .B(B), .compare(compare));

  assign out =
       (opcode==3'b000) ? temp_add :
       (opcode==3'b001) ? temp_sub :
       (opcode==3'b010) ? _and :
       (opcode==3'b011) ? _or :
       (opcode==3'b100) ? _xor :
       (opcode==3'b101) ? shiftleft :
       (opcode==3'b110) ? shiftright :
       (opcode==3'b111) ? compare :
       8'h00;

  assign carry =
       (opcode==3'b000) ? carry_add :
       (opcode==3'b001) ? carry_sub :
       1'b0;

endmodule


module ALU_8bit(input [7:0]A, input [7:0]B, input [2:0]opcode,output [7:0]out, output carry, output zero);

  mux _8operations(.A(A), .B(B), .opcode(opcode), .out(out), .carry(carry));

  assign zero = (out==8'b00000000) ? 1'b1 : 1'b0;

endmodule
