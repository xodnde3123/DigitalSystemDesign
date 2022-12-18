`timescale 1ns / 1ps

module ss_decoder(
    input [2:0] Din,
	input [3:0] data,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg e,
    output reg f,
    output reg g,
    output reg dp
    );

	 always @(Din)
	 case(Din)
	 
		3'b000 : begin
			a = ~data[0];
			b = ~data[1];
			c = ~data[2];
			d = ~data[3];
			e = 1;
			f = 1;
			g = 1;
			dp = 1;
			end
	
		3'b111 : begin
			a = ~data[0];
			b = 1;
			c = 1;
			d = ~data[1];
			e = ~data[2];
			f = ~data[3];
			g = 1 ;
			dp = 1;
			end
			
	    default: begin
			a = ~data[0];
			b = 1;
			c = 1;
			d = ~data[1];
			e = 1;
			f = 1;
			g = ~data[2];
			dp = ~data[3];
			end
		
		endcase
			

endmodule
