`timescale 1ns / 1ps

// state
`define STOP        3'b000
`define FORWARD     3'b001
`define BACKWARD    3'b010
`define GO_LEFT     3'b011
`define GO_RIGHT    3'b100

`define ss_S          4'b1100
`define ss_F          4'b1111
`define ss_B          4'b1011
`define ss_L          4'b1101
`define ss_R          4'b1110 

module export_data(
    input clk,
    input rst,
    input SW_EN,
    input is_crush,
    input [2:0] nstate,
    output reg motor_in0,
    output reg motor_in1,
    output reg motor_in2,
    output reg motor_in3,
    output reg motor_in4,
    output reg motor_in5,
    output reg motor_in6,
    output reg motor_in7,
    output reg [3:0] ssData
    );
   
    
always @(posedge clk)    
    if (rst) 
        begin
            motor_in0 <= 1'b0;
            motor_in1 <= 1'b0;
            motor_in2 <= 1'b0;
            motor_in3 <= 1'b0;
            motor_in4 <= 1'b0;
            motor_in5 <= 1'b0;
            motor_in6 <= 1'b0;
            motor_in7 <= 1'b0; 
            ssData <= `ss_S;
        end
    else if (SW_EN)
        if (is_crush)
            begin
                motor_in0 <= 1'b0;
                motor_in1 <= 1'b0;
                motor_in2 <= 1'b0;
                motor_in3 <= 1'b0;
                motor_in4 <= 1'b0;
                motor_in5 <= 1'b0;
                motor_in6 <= 1'b0;
                motor_in7 <= 1'b0; 
                ssData <= `ss_S;
            end
        else
            case(nstate)
                `STOP    :
                    begin  
                        motor_in0 <= 1'b0;
                        motor_in1 <= 1'b0;
                        motor_in2 <= 1'b0;
                        motor_in3 <= 1'b0;
                        motor_in4 <= 1'b0;
                        motor_in5 <= 1'b0;
                        motor_in6 <= 1'b0;
                        motor_in7 <= 1'b0; 
                        ssData <= `ss_S;
                    end
                `FORWARD :
                    begin
                        motor_in0 <= 1'b0;
                        motor_in1 <= 1'b1;
                        motor_in2 <= 1'b0;
                        motor_in3 <= 1'b1;
                        motor_in4 <= 1'b0;
                        motor_in5 <= 1'b1;
                        motor_in6 <= 1'b0;
                        motor_in7 <= 1'b1;
                        ssData <= `ss_F;
                    end
                    
                `BACKWARD : 
                    begin  
                        motor_in0 <= 1'b1;
                        motor_in1 <= 1'b0;
                        motor_in2 <= 1'b1;
                        motor_in3 <= 1'b0;
                        motor_in4 <= 1'b1;
                        motor_in5 <= 1'b0;
                        motor_in6 <= 1'b1;
                        motor_in7 <= 1'b0; 
                        ssData <= `ss_B;
                    end 
                    
                 `GO_LEFT  :  
                    begin
                        motor_in0 <= 1'b0;
                        motor_in1 <= 1'b1;
                        motor_in2 <= 1'b0;
                        motor_in3 <= 1'b1;
                        motor_in4 <= 1'b1;
                        motor_in5 <= 1'b0;
                        motor_in6 <= 1'b1;
                        motor_in7 <= 1'b0; 
                        ssData <= `ss_L;
                    end
                    
                `GO_RIGHT :  
                    begin  
                        motor_in0 <= 1'b1;
                        motor_in1 <= 1'b0;
                        motor_in2 <= 1'b1;
                        motor_in3 <= 1'b0;
                        motor_in4 <= 1'b0;
                        motor_in5 <= 1'b1;
                        motor_in6 <= 1'b0;
                        motor_in7 <= 1'b1; 
                        ssData <= `ss_R;
                    end
                default :  
                    begin
                        motor_in0 <= 1'b0;
                        motor_in1 <= 1'b0;
                        motor_in2 <= 1'b0;
                        motor_in3 <= 1'b0;
                        motor_in4 <= 1'b0;
                        motor_in5 <= 1'b0;
                        motor_in6 <= 1'b0;
                        motor_in7 <= 1'b0;
                        ssData <= `ss_S; 
                    end
            endcase
    else 
        begin
            motor_in0 <= 1'b0;
            motor_in1 <= 1'b0;
            motor_in2 <= 1'b0;
            motor_in3 <= 1'b0;
            motor_in4 <= 1'b0;
            motor_in5 <= 1'b0;
            motor_in6 <= 1'b0;
            motor_in7 <= 1'b0; 
            ssData <= `ss_S;
        end
endmodule

