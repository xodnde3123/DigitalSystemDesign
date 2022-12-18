
module tb_generate_pwm();

reg clk, rst;
wire JC1;

generate_pwm uut(
    clk,
    rst,
    JC1
    );

always #10 clk = ~clk;

initial 
    begin
        clk = 1'b0;
        rst = 1'b0;

        #1000 $stop;
    end

endmodule