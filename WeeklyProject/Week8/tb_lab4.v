`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/23 01:29:37
// Design Name: 
// Module Name: tb_lab4
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


module tb_lab4(
);
    
    reg [15:0] SW;
    reg BTNU;
    reg clk;
    
    wire [6:0] sseg;
    wire DP;
    wire [7:0]AN;
    
    lab_4_top lab_4_top_1(
        .SW(SW),
        .BTNU(BTNU), 
        .clk(clk),
        .sseg(sseg),
        .DP(DP),
        .AN(AN)
    );
    
    always #5 clk = ~clk;
    
    initial begin 
        clk = 0;
        SW = 16'd0;
        SW[15] = 1;
        #10 SW[15] = 0;
        #10 SW[0] = 1;
        #10 SW[0] = 0;
        #10 BTNU = 1;
        #10 BTNU = 0;
    end
        

endmodule
