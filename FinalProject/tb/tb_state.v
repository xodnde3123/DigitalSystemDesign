`timescale 1ns / 1ps

//input data
`define UP      'h71
`define DOWN    'h77 
`define LEFT    'h65 
`define RIGHT   'h72
`define ESTOP   'h74

// state
`define STOP        3'b000
`define FORWARD     3'b001
`define BACKWARD    3'b010
`define GO_LEFT     3'b011
`define GO_RIGHT    3'b100

module tb_state(
    );
    
    reg clk, rst;
    reg [1:0] acc_data;
    reg [7:0] data;
    wire isCrush;
    wire [2:0] nstate;
    
    generate_rc_car_control uut(
        clk,
        rst,
        acc_data,
        data,
        isCrush,
        nstate
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        acc_data = 1'b0;
        data = `ESTOP;
        
        #10 rst = 1'b0;
        
        #50 data = `UP;
        #50 data = `DOWN;
        #50 data = `LEFT;
        #50 data = `RIGHT;
        #50 data = `UP;
        #50 acc_data = 1'b1;
        #50 data = `DOWN;
        #50 data = `ESTOP;
        #50 data = `UP;
        #50 data = 'h70;
        
        
        #10 $stop;
    end 
endmodule
