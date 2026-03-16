// Code your design here
module ALU_4bit(input wire [3:0]A,input wire [3:0]B,input wire [2:0]opcode,output wire [3:0]out,output wire carry , output wire zero);
  wire [4:0]temp_add,temp_sub;
  assign temp_add=A+B;
  assign temp_sub=A-B;
  assign out=(opcode==3'b000) ? temp_add[3:0] :
    (opcode==3'b001) ? temp_sub[3:0] :
    (opcode==3'b010) ? A&B :
    (opcode==3'b011) ? A|B :
    (opcode==3'b100) ? A^B :
    (opcode==3'b101) ? A<<1 :
    (opcode==3'b110) ? A>>1 :
    (opcode==3'b111) ? (A==B)?4'b0001:4'b0000 :
    4'b0;
  assign carry=(opcode==3'b000) ? temp_add[4] : 
    (opcode==3'b001) ? temp_sub[4] :1'b0;
  assign zero=(out==4'b0000)  ? 1 : 0;
endmodule