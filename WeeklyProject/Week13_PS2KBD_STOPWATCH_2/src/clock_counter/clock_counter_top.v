`timescale 1ns / 1ps

module clock_counter_top(
    input clk,
    input rst,
    input is_reset,
    input is_stop ,
    input is_start,
    output [3:0] dataMin1   , 
    output [3:0] dataMin10  ,
    output [3:0] dataSec1   , 
    output [3:0] dataSec10  , 
    output [3:0] dataSecU1  ,
    output [3:0] dataSecU2   
    );

wire inc;
wire tcSecU2    ;
wire tcSecU1    ;
wire tcSec1     ;
wire tcSec10    ;
wire tcMin1     ;
wire tcMin10    ;

wire [3:0] secU2    ;
wire [3:0] secU1    ;
wire [3:0] sec1     ;
wire [3:0] sec10    ;
wire [3:0] min1     ;
wire [3:0] min10    ;

clk_div_under_100(
    .clk    (clk), // 100MHz
    .rst    (rst),
    .is_reset   (is_reset),
    .is_stop    (is_stop ),
    .is_start   (is_start),
    .enable (inc)
    );


BC9 bc9_secu2(
    .clk    (clk),
    .rst    (rst),
    .is_reset   (is_reset),
    .Q          (secU2),
    .inc        (inc),
    .TC         (tcSecU2)
    );

BC9 bc9_secu1(
    .clk        (clk),
    .rst        (rst),
    .is_reset   (is_reset),
    .Q          (secU1),
    .inc        (tcSecU2),
    .TC         (tcSecU1)
    );

BC9 bc9_sec1(
    .clk        (clk),
    .rst        (rst),
    .is_reset   (is_reset),
    .Q          (sec1),
    .inc        (tcSecU1),
    .TC         (tcSec1)
    );

BC6 bc6_sec10(
    .clk        (clk),
    .rst        (rst),
    .is_reset   (is_reset),
    .Q          (sec10),
    .inc        (tcSec1),
    .TC         (tcSec10)
    );

BC9 bc9_min1(
    .clk        (clk),
    .rst        (rst),
    .is_reset   (is_reset),
    .Q          (min1),
    .inc        (tcSec10),
    .TC         (tcMin1)
    );

BC6 bc6_min10(
    .clk        (clk),
    .rst        (rst),
    .is_reset   (is_reset),
    .Q          (min10),
    .inc        (tcMin1),
    .TC         (tcMin10)
    );

assign dataMin10 = min10;
assign dataMin1  = min1 ;
assign dataSec1  = sec1 ;
assign dataSec10 = sec10;
assign dataSecU1 = secU1;
assign dataSecU2 = secU2;


endmodule
