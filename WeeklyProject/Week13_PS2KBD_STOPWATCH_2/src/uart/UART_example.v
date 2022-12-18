module UART_example(
    input clk,
    input rst,
    input RxD,
    output error,
    output TxD,
    output [6:0] sseg,
    output ssDP,
    output [7:0] AN
);

wire [7:0] datain_ext, dataout_ext;
wire new_in, new_out;

UART_top uartTop(
    .clk(clk),                    
    .rst(rst),
    .datain_ext(datain_ext),  
    .dataout_ext(dataout_ext), 
    .new_in(new_in),            
    .new_out(new_out),           
    .error(error),
    .RxD(RxD),
    .TxD(TxD)
);

assign datain_ext = dataout_ext;
assign new_in = new_out;

ss_drive segment (
    .clk(clk), 
    .rst(rst), 
    .mask(8'b0000_0011), 
    .data(dataout_ext),
    .ssA(sseg[0]), .ssB(sseg[1]), .ssC(sseg[2]), .ssD(sseg[3]), 
    .ssE(sseg[4]), .ssF(sseg[5]), .ssG(sseg[6]), .ssDP(ssDP),
    .AN7(AN[7]), .AN6(AN[6]), .AN5(AN[5]), .AN4(AN[4]),
    .AN3(AN[3]), .AN2(AN[2]), .AN1(AN[1]), .AN0(AN[0])
    );
    
endmodule