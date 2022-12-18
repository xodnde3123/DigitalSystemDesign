`timescale 1ns / 1ps

module ss_drive(
    input clk,
    input rst,
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
    
    parameter itsMs = 10;
    parameter numMs = 1000;
    parameter Ms2Cnt = 100000;
    
	reg sel;
	reg [3:0] data, num;
	integer cnt;
	
    
	always @(posedge clk)
		if(rst)
			begin
			cnt <= 0;
			sel <= 1'b0;
			num <= 4'b0000;
			end
	        
		else if (cnt < Ms2Cnt * numMs) //100MEGHz / 20000 = 5KHz = 1/ (0,2ms) // 20000 -> 0.2ms
            begin
		    cnt <= cnt + 1;
		        if (cnt % Ms2Cnt * itsMs == 0)
                    sel = ~sel;
			end
			
		else
            begin
			cnt <= 0;
            num <= num + 1;
			     if (num == 4'b1111) 
                     num <= 4'b0000; 
			end

	always @(num, sel, mask)
		case(sel)
			1'b0 : begin
				data = num;
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
                data = num;
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
