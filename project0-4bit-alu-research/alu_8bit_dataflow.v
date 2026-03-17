module ALU_8bit(input wire [7:0]A,input wire [7:0]B,input wire [2:0]opcode,output wire [7:0]out,output wire carry , output wire zero);
  wire [8:0]temp_add,temp_sub;
  assign temp_add=A+B;
  assign temp_sub=A-B;
  assign out=(opcode==3'b000) ? temp_add[7:0] :
    (opcode==3'b001) ? temp_sub[7:0] :
    (opcode==3'b010) ? A&B :
    (opcode==3'b011) ? A|B :
    (opcode==3'b100) ? A^B :
    (opcode==3'b101) ? A<<1 :
    (opcode==3'b110) ? A>>1 :
    (opcode==3'b111) ? (A==B)?8'b00000001:8'b00000000 :
    8'b0000000;
  assign carry=(opcode==3'b000) ? temp_add[8] : 
    (opcode==3'b001) ? temp_sub[8] :1'b0;
  assign zero=(out==8'h00)  ? 1 : 0;
endmodule