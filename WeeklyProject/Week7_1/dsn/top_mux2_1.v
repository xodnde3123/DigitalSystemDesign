`timescale 1ns / 1ps


module top_mux2_1(
    input   clk,
    input   rst,
    input   sel,
    input   [3:0] A,
    input   [3:0] B,
    output  [6:0] sseg,
    output  ssdp,
    output  [7:0] AN
    );
    
    
    wire [3:0] O;
    
    mux2_1 u1(
        .A(A),
        .B(B),
        .sel(sel),
        .O(O)
    );
    
   ss_drive segment(
        .clk(clk), 
        .rst(rst), 
        .data7(), 
        .data6(), 
        .data5(), 
        .data4(), 
        .data3(), 
        .data2(), 
        .data1(), 
        .data0(O), 
        .mask(8'h1), 
        .ssA(sseg[0]), 
        .ssB(sseg[1]), 
        .ssC(sseg[2]), 
        .ssD(sseg[3]), 
        .ssE(sseg[4]), 
        .ssF(sseg[5]), 
        .ssG(sseg[6]), 
        .ssDP(ssdp), 
        .AN7(AN[7]), 
        .AN6(AN[6]), 
        .AN5(AN[5]), 
        .AN4(AN[4]),
        .AN3(AN[3]), 
        .AN2(AN[2]), 
        .AN1(AN[1]), 
        .AN0(AN[0])
        );

        
    
endmodule
