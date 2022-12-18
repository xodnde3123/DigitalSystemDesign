`timescale 1ns / 1ps


module tb_stop_watch_control;

reg clock, reset;
reg released;
reg [7:0] scancode;
reg [7:0] dataUart;
wire is_reset, is_stop, is_start;

stop_watch_control uut(
    clock,
    reset,
    released,
    scancode,
    dataUart,
    is_reset,
    is_stop,
    is_start
    );

always #5 clock = ~clock;

initial begin

    clock = 1'b0;
    reset = 1'b1;
    released = 1'b0;
    scancode = 'h00;
    dataUart = 'hxx; 
       
    #10 reset = 1'b0;
    
    #30 scancode = 'h73; // START
        released = 1'b1;  
    
    #15 released = 1'b0;
    
    #30 scancode = 'h74; // STOP    
    
    #30 scancode = 'h0D; // ENTER
    
    #30 scancode = 'h73; // START
        released = 1'b1;  
        
    #30 scancode = 'h74; // STOP 
        released = 1'b0;
        
    #30 scancode = 'h73; // START (x)
    
    #30 scancode = 'h0D; // ENTER
    
    #10 $stop;
    
end
    


endmodule
