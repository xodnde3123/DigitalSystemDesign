`timescale 1ns / 1ps

module ss_drive(
    input clk,
    input rst,
    input [3:0] data1,
    input [3:0] data0,
	input [7:0] mask,
    output ssA,
    output ssB,
    output ssC,
    output ssD,
    output ssE,
    output ssF,
    output ssG,
    output ssDP,
    output reg AN7,
    output reg AN6,
    output reg AN5,
    output reg AN4,
    output reg AN3,
    output reg AN2,
    output reg AN1,
    output reg AN0
    );
    
	reg sel;
	reg [3:0] data;
	integer cnt;
    
	always @(posedge clk)
		if(rst)
			begin
			cnt <= 0;
			sel <= 1'b0;
			end
		else if (cnt < 20000 * 6.25) //100MEGHz / 20000 = 5KHz = 1/ (0,2ms). 0.2ms * 8 = 1.6ms * 6.25 = 10ms
			begin
			cnt <= cnt + 1;
			sel <= sel;
			end
		else 
			begin
			cnt <= 0;
			sel <= ~sel;
			end

	always @(data1, data0, sel, mask)
		case(sel)
			1'b0 : begin
				data = data0;
				AN7 = 1;
                AN6 = 1;
                AN5 = 1;
                AN4 = 1;
				AN3 = 1;
				AN2 = 1;
				AN1 = 1;
				AN0 = 0 | (~mask[0]);
				end
			1'b1 : begin
                data = data1;
                AN7 = 1;
                AN6 = 1;
                AN5 = 1;
                AN4 = 1;
                AN3 = 1;
                AN2 = 1;
                AN1 = 0 | (~mask[1]);
                AN0 = 1;
                end
		endcase
	
	ss_decoder data_decode (
    .Din(data), 
    .a(ssA), 
    .b(ssB), 
    .c(ssC), 
    .d(ssD), 
    .e(ssE), 
    .f(ssF), 
    .g(ssG), 
    .dp(ssDP)
    );

		


endmodule
