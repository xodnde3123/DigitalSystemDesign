`timescale 1ns / 1ps
module make_tick(   input   wire    clk,    rst,    Din,
                    output  wire    Dout                );

integer cnt;
wire    a;
reg     b,  c;

assign  a   =   Din;

always @(posedge clk)   begin
    if(rst==1) begin
        b <= 0;
        c <= 0;
    end
    else begin
        b <= a;
        c <= b;
    end
end

assign Dout = (~c & b);

endmodule
