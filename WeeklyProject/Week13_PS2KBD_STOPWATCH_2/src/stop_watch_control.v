
`timescale 1ns / 1ps

`define ENTER   'h0D
`define START   'h73
`define STOP    'h74 

module stop_watch_control(
    input clk,
    input rst,
    input released,
    input [7:0] data,
    input [7:0] dataUart,
    output reg is_reset,
    output reg is_stop,
    output reg is_start
    );


always @(posedge clk)
    if(rst)
        begin
            is_reset <= 1'b0;
            is_start <= 1'b0;
            is_stop <= 1'b0;
        end
    else
        case(data)
            `ENTER:  
                begin
                is_reset    <= 1'b1;
                is_start    <= 1'b0;
                is_stop     <= 1'b0;
                end
            `START:  
                if(released)
                    begin
                    is_reset    <= 1'b0;
                    is_start    <= 1'b1;
                    is_stop     <= 1'b0;
                    end
            `STOP:   
                begin
                is_reset    <= 1'b0;
                is_start    <= 1'b0;
                is_stop     <= 1'b1;
                end
                
            default: 
                begin
                is_reset <= 1'b0;
                is_start <= 1'b0;
                is_stop <= 1'b0;
                end
        endcase  
           
endmodule

