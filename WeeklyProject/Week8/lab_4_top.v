`timescale 1ns / 1ps
module lab_4_top(   input   wire            clk,    rst,    BTNU,
                    input   wire    [15:0]  SW,
                    output  wire            DP,
                    output  wire    [6:0]   sseg,
                    output  wire    [7:0]   AN                      );

wire        reset,      sw_out,     sw_out_tick;
wire        btn_out,    btn_out_tick;
wire [3:0]  bcd1,       bcd1_tick;
wire [3:0]  bcd0,       bcd0_tick;

meta_harden meta_harden_1(  .clk_dst(clk),          .rst_dst(rst),      .signal_src(SW[15]),    .signal_dst(reset)  );

debouncer debouncer_sw(     .reset(reset),          .clk(clk),          
                            .sw_in(SW[0]),          .sw_out(sw_out),    .sw_out_tick(sw_out_tick)                   );

debouncer debouncer_btn(    .clk(clk),              .reset(reset),
                            .sw_in(BTNU),           .sw_out(btn_out),   .sw_out_tick(btn_out_tick)                  );

Counting_Addition_Logic CL_1(   .clk(clk),          .reset(reset),      .sw_out(sw_out),        .sw_out_tick(sw_out_tick),
                                .btn_out(btn_out),  .btn_out_tick(btn_out_tick),
                                .bcd1(bcd1),        .bcd1_tick(bcd1_tick),  .bcd0(bcd0),        .bcd0_tick(bcd0_tick)       );

sseg_display_1 sseg_data(       .clk(clk),          .bcd0(bcd0),            .bcd1(bcd1),        .bcd1_tick(bcd1_tick),
                                .AN(AN),            .sseg(sseg),            .DP(DP),            .bcd0_tick(bcd0_tick)   );
endmodule
