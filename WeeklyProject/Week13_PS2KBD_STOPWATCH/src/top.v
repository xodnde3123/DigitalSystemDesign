`timescale 1ns / 1ps

module ps2_example (
		input wire clk,
		input wire rst,
		input wire ps2clk,
		input wire ps2data,
		output wire Released,
		output wire ssA,
		output wire ssB,
		output wire ssC,
		output wire ssD,
		output wire ssE,
		output wire ssF,
		output wire ssG,
		output wire ssDP,
		output wire AN7,
        output wire AN6,
        output wire AN5,
        output wire AN4,
        output wire AN3,
        output wire AN2,
		output wire AN1,
		output wire AN0
		);
		
wire [7:0] scancode;
wire err_ind;
wire clk_50;
wire clk_100;
    
    
clk_wiz_0 clk_core(
  // Clock in ports
   .clk_in1(clk),      // input clk_in1
   // Clock out ports
   .clk_out1(clk_100),     // output clk_out1
   .clk_out2(clk_50),     // output clk_out2
   // Status and control signals
   .reset(rst), // input reset
   .locked()
);      // output locked
    
ps2_kbd_top ps2_kbd (
    .clk(clk_50), 
    .rst(rst), 
    .ps2clk(ps2clk), 
    .ps2data(ps2data), 
    .scancode(scancode), 
    .Released(Released), 
    .err_ind(err_ind)
    );
	 
ss_drive ss_drive (
    .clk(clk_100), 
    .rst(rst), 
    .data7(), 
    .data6(), 
    .data5(), 
    .data4(), 
    .data3(), 
    .data2(), 
    .data1(scancode[7:4]), 
    .data0(scancode[3:0]), 
    .mask(8'b0000_0011), 
    .ssA(ssA), 
    .ssB(ssB), 
    .ssC(ssC), 
    .ssD(ssD), 
    .ssE(ssE), 
    .ssF(ssF), 
    .ssG(ssG), 
    .ssDP(ssDP), 
    .AN7(AN7), 
    .AN6(AN6), 
    .AN5(AN5), 
    .AN4(AN4),
    .AN3(AN3), 
    .AN2(AN2), 
    .AN1(AN1), 
    .AN0(AN0)
    );
	 
endmodule
