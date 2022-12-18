`timescale 1ns / 1ps

module stop_watch_top(
    input clk,
    input rst,
    input RxD,
    input ps2clk,
    input ps2data,
    output TxD,
    output Released,
    output ssA,
    output ssB,
    output ssC,
    output ssD,
    output ssE,
    output ssF,
    output ssG,
    output ssDP,
    output AN7,
    output AN6,
    output AN5,
    output AN4,
    output AN3,
    output AN2,
    output AN1,
    output AN0  
    );
 

wire clk_50;
wire clk_100;

wire [7:0] scancode;
wire err_ind;

wire [7:0] datain_ext, dataout_ext;
wire new_in, new_out;


wire [3:0] dataSecU2 ;
wire [3:0] dataSecU1 ;
wire [3:0] dataSec1  ;
wire [3:0] dataSec10 ;
wire [3:0] dataMin1  ;
wire [3:0] dataMin10 ;

wire is_reset, is_start, is_stop;

wire mode_ps2, mode_uart;


clk_wiz_0 clk_core(
  // Clock in ports
   .clk_in1(clk),           // input clk_in1

   // Clock out ports
   .clk_out1(clk_100),      // output clk_out1
   .clk_out2(clk_50),       // output clk_out2

   // Status and control signals
   .reset(rst),             // input reset
   .locked()                // output locked
);      


// uart error
// ps2 released pin overlap...


//UART_top uartTop(
//    .clk(clk_100),                    
//    .rst(rst),
//    .datain_ext(datain_ext),  
//    .dataout_ext(dataout_ext), 
//    .new_in(new_in),            
//    .new_out(new_out),           
//    .error(Released),
//    .RxD(RxD),
//    .TxD(TxD)
//);


//assign datain_ext = dataout_ext;
//assign new_in = new_out;


ps2_kbd_top ps2_kbd (
    .clk    (clk_50), 
    .rst    (rst), 
    .ps2clk (ps2clk), 
    .ps2data    (ps2data), 
    .scancode   (scancode), 
    .Released   (Released), 
    .err_ind    (err_ind)
    );


stop_watch_control stop_watch_ctrl(
    .clk        (clk_100),
    .rst        (rst),
    .released   (Released),
    .data       (scancode),
    .dataUart   (dataout_ext),
    .is_reset   (is_reset),
    .is_stop    (is_stop ),
    .is_start   (is_start)
    );


clock_counter_top clkCnt(
    .clk        (clk_100),
    .rst        (rst),
    .is_reset   (is_reset),
    .is_stop    (is_stop ),
    .is_start   (is_start),
    .dataMin1   (dataMin1),
    .dataMin10  (dataMin10),
    .dataSec1   (dataSec1),
    .dataSec10  (dataSec10),
    .dataSecU1  (dataSecU1),
    .dataSecU2  (dataSecU2)    
    );


ss_drive ss_drive (
    .clk    (clk_100), 
    .rst    (rst), 
    .data7  (), 
    .data6  (), 
    .data5  (dataMin10), 
    .data4  (dataMin1), 
    .data3  (dataSec10), 
    .data2  (dataSec1), 
    .data1  (dataSecU1), 
    .data0  (dataSecU2), 
    .mask   (8'b0011_1111), 
    .ssA    (ssA), 
    .ssB    (ssB), 
    .ssC    (ssC), 
    .ssD    (ssD), 
    .ssE    (ssE), 
    .ssF    (ssF), 
    .ssG    (ssG), 
    .ssDP   (ssDP), 
    .AN7    (AN7), 
    .AN6    (AN6), 
    .AN5    (AN5), 
    .AN4    (AN4),
    .AN3    (AN3), 
    .AN2    (AN2), 
    .AN1    (AN1), 
    .AN0    (AN0)
    );
    
endmodule
