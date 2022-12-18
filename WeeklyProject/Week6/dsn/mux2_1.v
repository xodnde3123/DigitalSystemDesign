`timescale 1ns / 1ps

module mux2_1(
    input   [3:0] A,
    input   [3:0] B,
    input   sel,
    output  [3:0] O
    );
    
    
    assign O = (~sel)? A : B;
    
endmodule
