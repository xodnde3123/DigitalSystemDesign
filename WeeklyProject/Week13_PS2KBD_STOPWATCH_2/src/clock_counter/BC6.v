`timescale 1ns / 1ps

module BC6 (clk, rst, is_reset, inc, Q, TC);

input rst, clk;
input is_reset;
input inc;

output reg [3:0] Q ;
output TC ;


wire finl; 

always @(posedge clk) 
  if(rst || is_reset) Q <= 4'd0;

  else if (inc) 
    if(fin) Q <= 4'd0;
    else Q <= Q + 1;

assign fin = (Q == 4'd5) ? 1 : 0;
assign TC = fin & inc ;

endmodule



