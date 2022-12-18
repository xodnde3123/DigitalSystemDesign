`timescale 1ns / 1ps

module ss_drive(
    input clk, rst,
    input [19:0] data,
	input [7:0] mask,
    output ssA, ssB, ssC, ssD,
    output ssE, ssF, ssG, ssDP,
    output reg AN7, AN6, AN5, AN4,
    output reg AN3, AN2, AN1, AN0
    );	
    
	reg [2:0] sel;
	integer cnt; // 20 bit counter wil also be OK
    
	reg [3:0] data7;
	reg [3:0] data6;
	reg [3:0] data5;
	reg [3:0] data4;
	reg [3:0] data3;
	reg [3:0] data2;
	reg [3:0] data1;
	reg [3:0] data0;
    reg [3:0] _data;

	always @(posedge clk)
		if(rst)
            begin
            cnt <= 0;
            sel <= 3'b000;
            end
		else if (cnt < 100000) // 
			begin
			cnt <= cnt + 1;
			sel <= sel;
			end
		else 
			begin
			cnt <= 0;
			sel <= sel + 1;
			end

    // DECODER AND MUX 
	always @(data7,data6,data5,data4,data3, data2, data1, data0, sel, mask) 
	begin
        
        { AN7, AN6, AN5, AN4, AN3, AN2, AN1, AN0 } = 8'b1111_1111;          // ALL OFF
        
        data7 = {data[19:17], data[0]};
        data6 = {2'b00, data[16], data[1]};
        data5 = {2'b00, data[15], data[2]};
        data4 = {2'b00, data[14], data[3]};
        data3 = {2'b00, data[13], data[4]};
        data2 = {2'b00, data[12], data[5]};
        data1 = {2'b00, data[11], data[6]};
        data0 = data[10:7];
        
		case(sel)
			3'b000 : begin   AN0 = 0 | (~mask[0]);  _data = data0; end     // SSEG1, 
			3'b001 : begin   AN1 = 0 | (~mask[0]);  _data = data1; end
            3'b010 : begin   AN2 = 0 | (~mask[0]);  _data = data2; end
            3'b011 : begin   AN3 = 0 | (~mask[0]);  _data = data3; end      
        	3'b100 : begin   AN4 = 0 | (~mask[0]);  _data = data4; end   
            3'b101 : begin   AN5 = 0 | (~mask[0]);  _data = data5; end
            3'b110 : begin   AN6 = 0 | (~mask[0]);  _data = data6; end
            default: begin   AN7 = 0 | (~mask[0]);  _data = data7; end
            
		endcase
    end
	
	ss_decoder data_decode (
    	.Din(sel), 
		.data(_data), 
		.a(ssA), .b(ssB), .c(ssC), .d(ssD), .e(ssE), .f(ssF), .g(ssG), .dp(ssDP)
    );
endmodule
