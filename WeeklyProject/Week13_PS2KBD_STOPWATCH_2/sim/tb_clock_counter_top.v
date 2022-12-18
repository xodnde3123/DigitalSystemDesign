`timescale 1ns / 1ps

module tb_clock_counter_top;

reg clock, reset;
reg is_reset, is_stop, is_start;

wire [3:0] dataMin1, dataMin10;
wire [3:0] dataSec1, dataSec10;
wire [3:0] dataSecU1, dataSecU2;


clock_counter_top uut(
    clock,
    reset,
    is_reset,
    is_stop,
    is_start,
    dataMin1,
    dataMin10,
    dataSec1,
    dataSec10,
    dataSecU1,
    dataSecU2    
    );

always #5 clock = ~clock;

initial begin

    #100 reset = 1'b1;    
         is_reset = 1'b0; 
         is_stop = 1'b0;
         is_start = 1'b0;
    
    #100 reset = 1'b0;
         is_start = 1'b1;
   
    #100 is_stop = 1'b1;
         is_start = 1'b0;
    
    #100 $stop;
end

endmodule