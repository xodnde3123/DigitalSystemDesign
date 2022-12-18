`timescale 1ns / 1ps
module div_3bnt(    input   wire    clk,
                    output  wire    [2:0]   a   );
wire [17:0] count;

N_bit_binary_counter Counter(   .clk(clk),  .count(count)   );    

assign a = count[17:15];
    
endmodule
