`timescale 1ns / 1ps


module tb_BC6;

reg clock, reset;
reg is_reset;
reg inc;

wire [3:0] Q;
wire TC;

BC6 uut(
    clock,
    reset,
    is_reset,
    inc,
    Q,
    TC
    );

always #5 clock = ~clock;

initial begin
    clock = 1'b0;
    reset = 1'b1;
    is_reset = 1'b0;
    inc = 1'b0;

    #10 reset = 1'b0;
        inc = 1'b1;

    #85 is_reset = 1'b1;
    
    #5  is_reset = 1'b0;
        
    #50 $stop;
end


endmodule