`timescale 1ns / 1ps
module Counting_Addition_Logic(
    input wire      clk,        reset,
    input wire      sw_out,     sw_out_tick, 
    input wire      btn_out,    btn_out_tick,
    output wire [3:0]   bcd1,   bcd1_tick,
    output wire [3:0]   bcd0,   bcd0_tick
);

wire    [7:0]   count,          count_tick;
reg     [7:0]   count_reg,      count_tick_reg;

assign count = count_reg % 100;
assign count_tick = count_tick_reg % 100;

assign bcd1 = count / 10;
assign bcd0 = count % 10;

assign bcd1_tick = count_tick /10;
assign bcd0_tick = count_tick %10;

always @(posedge clk) 
begin
    if(reset)                   count_reg <= 8'd0;
    else if(sw_out & btn_out)   count_reg <= count + 8'd11;
    else if(sw_out)             count_reg <= count + 8'd1;
    else if(btn_out)            count_reg <= count + 8'd10;
    else                        count_reg <= count;
end

always @(posedge clk) 
begin
    if(reset)                               count_tick_reg <= 8'd0;
    else if(sw_out_tick & btn_out_tick)     count_tick_reg <= count_tick + 8'd11;
    else if(sw_out_tick)                    count_tick_reg <= count_tick + 8'd1;
    else if(btn_out_tick)                   count_tick_reg <= count_tick + 8'd10;
    else                                    count_tick_reg <= count_tick;
end

endmodule
