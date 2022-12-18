`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:07:49 10/12/2011 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
    input clk,
    input rst,
    output reg [3:0] Dout
    );

integer cnt;
reg en;
	 
always @(posedge clk, posedge rst)  // 4bit counter
	if(rst)
		Dout <= 4'b0;
	else if (en)
		Dout <= Dout + 1;
	else
		Dout <= Dout;
		
always @(posedge clk, posedge rst)  // clock_divider
	if (rst)
		begin
		cnt <= 'b0;
		en <= 'b0;
		end
	else if (cnt == 25000000)  // CNT -> ENABLE BIT CONTROL
		begin
		cnt <= 'b0;
		en <= 'b1;
		end
	else
		begin
		cnt <= cnt + 1;
		en <= 'b0;
		end

endmodule
