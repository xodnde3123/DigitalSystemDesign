`timescale 1ns / 1ps
module sseg_display_1(  input wire          clk,
                        input wire  [3:0]   bcd0,   bcd0_tick,
                        input wire  [3:0]   bcd1,   bcd1_tick,
                        output wire         DP,
                        output wire [6:0]   sseg,
                        output wire [7:0]   AN                      );
    
wire [2:0]  a;
wire [3:0]  y;
wire [7:0]  mark;

assign mask = 8'b00110011;

mux8_4_1 mux8_1     (   .data0(bcd0),           .data1(bcd1), 
                        .data2(4'd0),           .data3(4'd0), 
                        .data4(bcd0_tick),      .data5(bcd1_tick), 
                        .data6(4'd0),           .data7(4'd0),
                        .s(a),                  .y(y)               );
                        
div_3bnt choose_sseg(   .clk(clk),               .a(a)              );
hex2sseg hex2sseg_1 (    .hex(y),    .dp(DP),     .sseg(sseg)       );
Decoder3_8_1 DC3_8  (     .z(a),      .an(AN),     .mask(mask)      );

endmodule
