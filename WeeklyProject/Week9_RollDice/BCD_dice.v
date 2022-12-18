module BCD_dice(Q, TC, inc, rst, clk);

output [2:0] Q;
output TC;
input inc, rst, clk;
reg [2:0] Q;

wire fin;

always @(posedge clk)
    if(rst) Q <= 3'b000;
    else if(inc)
        if(fin) Q <= 3'b000;
        else Q <= Q + 1;

assign fin = (Q == 3'b111) ? 1: 0;
assign TC = fin & inc;

endmodule