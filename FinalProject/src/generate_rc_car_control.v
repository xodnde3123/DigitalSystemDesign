
//input data
`define UP      'h71
`define DOWN    'h77 
`define LEFT    'h65 
`define RIGHT   'h72
`define ESTOP   'h20

// state
`define STOP        3'b000
`define FORWARD     3'b001
`define BACKWARD    3'b010
`define GO_LEFT     3'b011
`define GO_RIGHT    3'b100


module generate_rc_car_control(
    input clk,
    input rst,
    input [1:0] acc_data,
    input [7:0] data,
    output reg is_crush,
    output reg [2:0] nstate
    );

reg [2:0] cstate;

always @(posedge clk)
    if(rst) begin
        cstate <= `STOP;
        is_crush <= 1'b0;
    end
    else if (acc_data == 1'b1 && data == `UP) is_crush <= 1'b1;
    else if (data == `DOWN) is_crush <= 1'b0;
    else cstate <= nstate;

always @(data)
    case(data)
        `UP    : nstate <= `FORWARD;
        `DOWN  : nstate <= `BACKWARD;
        `LEFT  : nstate <= `GO_LEFT;
        `RIGHT : nstate <= `GO_RIGHT;
        `ESTOP : nstate <= `STOP;
        default: nstate <= `STOP;
    endcase

endmodule