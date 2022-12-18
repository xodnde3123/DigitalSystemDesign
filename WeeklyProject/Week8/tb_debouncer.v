`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/10/23 02:20:59
// Design Name: 
// Module Name: tb_debouncer
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


module tb_debouncer(
);

reg reset, clk, sw_in;
wire sw_out, sw_out_tick;

integer i;

debouncer debouncer_1(
    .reset(reset),
    .clk(clk),
    .sw_in(sw_in),
    .sw_out(sw_out),
    .sw_out_tick(sw_out_tick)
);

always #5 clk = ~clk;

initial begin
    reset = 1;
    clk =0;
    sw_in =0;
    #10 reset = 0;
    for(i=0; i<=10; i = i +1) begin
        #1500000 sw_in = ~sw_in;
    end
    #30000000;
    for(i=0; i<=10; i = i+1) begin
        #1500000 sw_in = ~sw_in;
    end
    #30000000;
    $stop;
    
end

endmodule
