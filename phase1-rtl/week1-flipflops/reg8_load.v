// Code your design here
module eight_bit_reg(input wire clk, input wire rst,input wire load, input wire [7:0]d, output reg [7:0]q);
  
  always @(posedge clk or posedge rst) begin
    if(rst)
      q=8'd0;
    else if(load) q=d;
  end
endmodule
