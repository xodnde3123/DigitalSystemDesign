`timescale 1ns / 1ps

module select_mode(
    input [7:0] prePS2,
    input [7:0] preUart,
    input [7:0] dataPS2,
    input [7:0] dataUART,
    output reg mode_ps2,
    output reg mode_uart
    );


always @(dataPS2)
    begin
        if (prePS2 == dataPS2)    
            mode_ps2 <= 0;
        else
            mode_ps2 <= 1;
    end

always @(dataUART)
    begin
        if (preUart == dataUART)    
            mode_uart <= 0;
        else
            mode_uart <= 1;
    end
        

endmodule