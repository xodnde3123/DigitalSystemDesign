`timescale 1ns / 1ps

module rc_car_controller_top(
    input clk,
    input rst,
    
    input SW_EN,
    
    input RxD,
    output TxD,
    output Released,
    
    input JB2_RXD,
    output JB1_TXD,
   
    output [7:0] JC,
    
    input MISO,
    output MOSI,
    output SCLK,
    output CS,
    output [14:0] ACL_DATA,
    
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
   
wire    [2:0] nstate;

wire    [7:0] BLE_datain_ext, BLE_dataout_ext;
wire    BLE_new_in, BLE_new_out;
 
wire    [7:0] to_uart;
wire    [3:0] ssData;
wire    clk_4MHz;
wire    is_crush;

UART_top BLE_uartTop(
    .clk        (clk),                    
    .rst        (rst),
    .datain_ext (BLE_datain_ext),  
    .dataout_ext(BLE_dataout_ext),
    .to_uart    (to_uart), 
    .new_in     (BLE_new_in),            
    .new_out    (BLE_new_out),           
    .error      (Released),
    .RxD        (JB2_RXD),
    .TxD        (JB1_TXD)
);

assign BLE_datain_ext = BLE_dataout_ext;
assign BLE_new_in = BLE_new_out;

CLK_Gen gen_clk_4MHz(
    .clk        (clk),
    .clk_4MHz   (clk_4MHz)
    );

SPI_Master spi_accelerator(
    .clk    (clk_4MHz),
    .miso   (MISO),
    .mosi   (MOSI),
    .sclk   (SCLK),
    .cs     (CS),
    .acl_data(ACL_DATA)
    );
        
generate_rc_car_control controller(
    .clk        (clk_4MHz),
    .rst        (rst),
    .acc_data   (ACL_DATA[3]),
    .data       (BLE_dataout_ext),
    .is_crush   (is_crush),
    .nstate     (nstate)
    );

export_data to_rc_car(
    .clk        (clk_4MHz),
    .rst        (rst),
    .SW_EN      (SW_EN),
    .is_crush   (is_crush),
    .nstate     (nstate),
    .motor_in0  (JC[0]),
    .motor_in1  (JC[1]),
    .motor_in2  (JC[2]),
    .motor_in3  (JC[3]),
    .motor_in4  (JC[4]),
    .motor_in5  (JC[5]),
    .motor_in6  (JC[6]),
    .motor_in7  (JC[7]),
    .ssData     (ssData)
    );

ss_drive ss_drive (
    .clk    (clk_4MHz), 
    .rst    (rst), 
    .data7  (is_crush),
    .data6  (), 
    .data5  (ACL_DATA[3]), 
    .data4  (),
    .data3  (), 
    .data2  (), 
    .data1  (), 
    .data0  (ssData), 
    .mask   (8'b1010_0001), 
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