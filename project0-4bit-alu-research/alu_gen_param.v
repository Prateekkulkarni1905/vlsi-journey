module ALU_4bit #(parameter N=4) (input wire [N-1:0]A,input wire [N-1:0]B,input wire [2:0]opcode,output reg [N-1:0]out,output reg carry , output reg zero);
  
  wire [N:0]add_carry,sub_carry;
  wire [N-1:0]temp_and,temp_or,temp_xor,temp_add,temp_sub;

  
  genvar i;
  
  //Logial Bitwise Synthesis
  generate
    
    for(i=0;i<N;i=i+1) begin : gen_login
      assign temp_and[i]=A[i] & B[i];
      assign temp_or[i]=A[i] | B[i];
      assign temp_xor[i]=A[i] ^ B[i];
    end
    
  endgenerate
  
  //4 bit Adder 
  assign add_carry[0]=1'b0; 
  generate
    for(i=0;i<N;i=i+1) begin: gen_add
      
      assign temp_add[i]=A[i] ^ B[i] ^ add_carry[i];
      assign add_carry[i+1]=(A[i]&B[i])|(B[i]& add_carry[i])|(add_carry[i]& A[i]);
    end
   endgenerate
   
      
    //4 Bit Subtractor   
  assign sub_carry[0]=1'b0; 
  generate
    for(i=0;i<N;i=i+1) begin: gen_sub
      
      assign temp_sub[i]=A[i] ^ B[i] ^ sub_carry[i];
      assign sub_carry[i+1]=(~A[i]& B[i])|(B[i]& sub_carry[i])|(sub_carry[i]& (~A[i]));
    end
   endgenerate
  
  always @(*) begin
    carry=1'b0;
    zero=1'b0;
    case(opcode)
      3'b000 : begin
        out=temp_add[N-1:0];
        carry=add_carry[N];
      end
      3'b001 : begin
        out=temp_sub[N-1:0];
        carry=sub_carry[N];
      end
      3'b010 : out=temp_and;
      3'b011 : out=temp_or;
      3'b100 : out=temp_xor;
      3'b101 : out=A << 1;
      3'b110 : out=A >> 1;
      3'b111 : out=(A==B)? 1:0;
    endcase
    
    if (out==0) zero=1'b1;
  end
endmodule   
        