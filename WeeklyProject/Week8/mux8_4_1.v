`timescale 1ns / 1ps
module mux8_4_1(
    input wire  [3:0]   data0,  data1,  data2,  data3,  
    input wire  [3:0]   data4,  data5,  data6,  data7,
    input wire  [2:0]   s,
    output reg  [3:0]   y                               );
    
    always @(*)
    begin
        case(s[2:0])
            3'b000 : y = data0;
            3'b001 : y = data1;
            3'b010 : y = data2;
            3'b011 : y = data3;
            3'b100 : y = data4;
            3'b101 : y = data5;
            3'b110 : y = data6;
            3'b111 : y = data7;
        endcase
    end
endmodule
