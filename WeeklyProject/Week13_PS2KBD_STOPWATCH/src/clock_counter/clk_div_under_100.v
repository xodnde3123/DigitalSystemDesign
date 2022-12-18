`timescale 1ns / 1ps

module clk_div_under_100(
    input clk, // 100MHz
    input rst,
    input is_reset,
    input is_stop ,
    input is_start,
    output reg enable
    );
    
localparam MILLS102CNT = 1000000;

integer cnt;

always @(posedge clk)
    
    if (rst || is_reset) 
        begin
            cnt <= 0;
            enable <= 0;
        end

    else if(is_start)
        if (cnt < MILLS102CNT)
            begin
                cnt <= cnt + 1;
                enable <= 0;
            end
        else 
            begin
            enable <= 1;
            cnt <= 0;
            end

    else if (is_stop)
        begin
        cnt <= cnt;
        enable <= 0;
        end
                
endmodule
