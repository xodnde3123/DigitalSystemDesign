`timescale 1ns / 1ps
module N_bit_binary_counter(
    input clk,
    output [17:0]count
    );
    
    reg [17:0]a = 0;
    always @(posedge clk) begin
        a <= a+1;
    end
    
    assign count = a;

endmodule
