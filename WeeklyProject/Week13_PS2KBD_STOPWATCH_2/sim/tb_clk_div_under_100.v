`timescale 1ns / 1ps


module tb_clk_div_under_100;

reg clock, reset;
reg is_reset, is_stop, is_start;
wire enable;

clk_div_under_100 uut(
    clock, // 100MHz
    reset,
    is_reset,
    is_stop,
    is_start,
    enable
    );

always #5 clock = ~clock;

initial begin

    clock = 1'b0;
    reset = 1'b0;
    is_reset = 1'b0;
    is_stop = 1'b0;
    is_start = 1'b1;
 

    

end

endmodule