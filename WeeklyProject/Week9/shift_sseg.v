module shift_sseg(
    input clk, rst, 
    output reg [19:0]dataSseg
    );
    
    integer cnt2;

    
    always @(posedge clk)
        if(rst) 
            begin
                cnt2 <= 0;
                dataSseg <= 20'b0000_0000_0000_1111_1111;
            end
        else if(cnt2 < 10000000) cnt2 <= cnt2 + 1;
        else  
            begin
            dataSseg <= {dataSseg[18:0], dataSseg[19]}; 
            cnt2 <= 0 ;
            end
endmodule