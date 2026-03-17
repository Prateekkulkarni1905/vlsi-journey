module ALU_8bit(input wire [7:0]A,input wire [7:0]B,input wire [2:0]opcode,output reg [7:0]out,output reg carry , output reg zero);
                
         always @(*) begin
           zero=0;carry=0;
           case (opcode)
             3'b000 : {carry,out}=A+B;//Addition
             3'b001 : {carry,out}=A-B;//Subtraction
             3'b010 : out=A&B;//bitwise AND
             3'b011 : out=A|B;//bitwise OR
             3'b100 : out=A^B;//bitwise XOR
             3'b101 : out=A<<1;//Shift to Left
             3'b110 : out=A>>1;//Shift to Right
             3'b111 : out = (A == B) ? 8'b00000001 : 8'b00000000; // Compare
        default: out = 8'b00000000;

        endcase

    if(out == 8'b00000000)
        zero = 1;

          end
endmodule