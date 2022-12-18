`timescale 1ns / 1ps


module tb_BC9;

reg clock, reset;
reg is_reset;
reg inc;

wire [3:0] Q;
wire TC;

BC9 uut(
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

    #150 is_reset = 1'b1;
    
    #10  is_reset = 1'b0;
        
    #100 $stop;
end


endmodule