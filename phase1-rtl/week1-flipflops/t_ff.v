// Code your design here
module t_ff(input wire clk,input wire t, input wire rst, output reg q);
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      q=0;
    end
    else if(t) q=~q;
    else q=q;
       end
endmodule
