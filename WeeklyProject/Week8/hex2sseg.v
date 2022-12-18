`timescale 1ns / 1ps
module hex2sseg(    input wire  [3:0]   hex,
                    output wire         dp,              
                    output reg  [6:0]   sseg    );
always @(hex[3:0])
begin
    case(hex[3:0])
        4'b0000 : sseg = 7'b1000000;
        4'b0001 : sseg = 7'b1111001;
        4'b0010 : sseg = 7'b0100100;
        4'b0011 : sseg = 7'b0110000;
        4'b0100 : sseg = 7'b0011001;
        4'b0101 : sseg = 7'b0010010;
        4'b0110 : sseg = 7'b0000010;
        4'b0111 : sseg = 7'b1111000;
        4'b1000 : sseg = 7'b0000000;
        4'b1001 : sseg = 7'b0010000;
        4'b1010 : sseg = 7'b0100000;
        4'b1011 : sseg = 7'b0000011;
        4'b1100 : sseg = 7'b0100111;
        4'b1101 : sseg = 7'b0100001;
        4'b1110 : sseg = 7'b0000110;
        4'b1111 : sseg = 7'b0001110;
    endcase
end

assign dp = 1'b1;
endmodule 