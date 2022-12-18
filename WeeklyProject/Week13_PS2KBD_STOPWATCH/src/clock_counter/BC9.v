`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/18 13:49:29
// Design Name: 
// Module Name: BCD
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BC9 (clk, rst, is_reset, inc, Q, TC);

input rst, clk;
input inc;
input is_reset;
output reg [3:0] Q ;
output TC ; // indicate terminal count


wire finl; // Q reached terminal value

always @(posedge clk) 
  if(rst || is_reset) Q <= 4'd0; // sychronous reset

  else if (inc) 
    if(fin) Q <= 4'd0;
    else Q <= Q + 1;

assign fin = (Q == 4'd9)?1:0;
assign TC = fin & inc ;

endmodule

