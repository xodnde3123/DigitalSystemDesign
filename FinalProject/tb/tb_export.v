`timescale 1ns / 1ps

// state
`define STOP        3'b000
`define FORWARD     3'b001
`define BACKWARD    3'b010
`define GO_LEFT     3'b011
`define GO_RIGHT    3'b100 

module tb_export(
    );
    
    reg clk, rst, SW_EN, is_crush;
    reg [2:0] nstate;
    wire motor_in0, motor_in1, motor_in2, motor_in3, motor_in4, motor_in5, motor_in6, motor_in7;
    wire [3:0] ssData;
    
    export_data ut(
        clk,
        rst,
        SW_EN,
        is_crush,
        nstate,
        motor_in0,
        motor_in1,
        motor_in2,
        motor_in3,
        motor_in4,
        motor_in5,
        motor_in6,
        motor_in7,
        ssData
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        SW_EN = 1'b1;
        is_crush = 1'b0;
        
        #10 rst = 1'b0;
            nstate = `STOP;
        #50 nstate = `FORWARD;
        
        #50 nstate = `GO_LEFT;
            
        #50 nstate = `GO_RIGHT;
        
        #50 nstate = `BACKWARD;
        
        #50 nstate = `GO_LEFT;
        
        #50 nstate = `GO_RIGHT;
        #50 nstate = `STOP;
            SW_EN = 1'b0;
            
        #50 nstate = `FORWARD;
        #50 nstate = `GO_LEFT;
        #50 nstate = `GO_RIGHT;
        #50 nstate = `BACKWARD;
        #50 SW_EN = 1'b1;
        
            nstate = `FORWARD;
        #50 is_crush = 1'b1;
        #50 is_crush = 1'b0;
        #50 nstate = `BACKWARD;
        #50 nstate = `GO_LEFT;
        #50 nstate = `GO_RIGHT;
        
        #10 $stop;
    end
endmodule
