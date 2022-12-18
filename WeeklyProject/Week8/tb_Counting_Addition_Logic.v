`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/23 01:41:33
// Design Name: 
// Module Name: tb_Counting_Addition_Logic
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


module tb_Counting_Addition_Logic(
);

reg clk, reset, sw_out, sw_out_tick, btn_out, btn_out_tick;
wire [3:0] bcd1, bcd0, bcd1_tick, bcd0_tick;

Counting_Addition_Logic Counting_Addition_Logic_tb(
    .clk(clk), .reset(reset), .sw_out(sw_out), .sw_out_tick(sw_out_tick), .btn_out(btn_out), .btn_out_tick(btn_out_tick),
    .bcd1(bcd1), .bcd0(bcd0),
    .bcd1_tick(bcd1_tick), .bcd0_tick(bcd0_tick)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        sw_out =0;
        sw_out_tick =0;
        btn_out =0;
        btn_out_tick=0;
        #10 reset =0;
        #10 sw_out =1;
            sw_out_tick = 1;
        #10 sw_out_tick = 0;
        #30 sw_out =0;
    end
    
endmodule
