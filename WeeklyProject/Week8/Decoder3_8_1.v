`timescale 1ns / 1ps
module Decoder3_8_1(    input   wire    [2:0]   z,
                        input   wire    [7:0]   mask,
                        output  reg     [7:0]   an      );
always @(z[2:0])
begin
    case(z[2:0])
        3'b000 : an = 8'b11111110 | (~mask);
        3'b001 : an = 8'b11111101 | (~mask);
        3'b010 : an = 8'b11111011 | (~mask);
        3'b011 : an = 8'b11110111 | (~mask);
        3'b100 : an = 8'b11101111 | (~mask);
        3'b101 : an = 8'b11011111 | (~mask);
        3'b110 : an = 8'b10111111 | (~mask);
        3'b111 : an = 8'b01111111 | (~mask);
    endcase
end

endmodule
