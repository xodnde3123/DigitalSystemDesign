`timescale 1ns / 1ps
module debouncer
#(parameter FILTER = 2_000_000) //20ms for 100MHz
(   input   wire    clk,        reset,      sw_in,
    output wire     sw_out,     sw_out_tick         );

localparam RELOAD = FILTER -1;
integer cnt;
reg     sw_out_reg,     sw_in_sync0,        sw_in_sync1;

make_tick sw_tick(  .clk(clk),  .rst(reset),    .Din(sw_out),   .Dout(sw_out_tick)  );
// metastablility hardener for sw_in
always @(posedge clk)   begin
    if(reset)   begin   sw_in_sync0 <= 0;       sw_in_sync1 <= 0;               end
    else        begin   sw_in_sync0 <= sw_in;   sw_in_sync1 <= sw_in_sync0;     end
end

always @(posedge clk) begin
    if(reset)   begin   sw_out_reg <= sw_in_sync1;  cnt <= RELOAD;    end
    else    begin  
        if(sw_in_sync1 == sw_out_reg)   begin   cnt <= RELOAD;                              end
        else if(cnt == 0)               begin   cnt <= RELOAD;   sw_out_reg <= sw_in_sync1; end
        else                            begin   cnt <= cnt -1;                              end
    end
end

assign sw_out = sw_out_reg;

endmodule 