`timescale 1ns / 1ps


module top_mux2_1_NSEL(
    input   clk,
    input   rst,
    output  [6:0] sseg,
    output  ssdp,
    output  [7:0] AN
    );
    
   defparam segment.itsMs = 10, segment.numMs = 1000;
   ss_drive segment(
        .clk(clk), 
        .rst(rst), 
        .mask(8'b00000011), 
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
