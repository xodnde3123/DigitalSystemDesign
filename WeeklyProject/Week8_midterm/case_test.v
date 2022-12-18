module tb_case_test;

reg [3:0] encode;
integer ns, ns2;

initial 
    begin
        encode = 0;
//        #10 encode = 4'bxxxx;
//        #10 encode = 4'b10xz;
//        #10 encode = 4'bx11x;
//        #10 encode = 4'b1111;
//        #10 encode = 4'b0001;
//        #10 encode = 4'b0xx0;
         #10 encode = 4'b0000;
         #10 encode = 4'b0001;
         #10 encode = 4'b0010;
         #10 encode = 4'b0011;
         #10 encode = 4'b0100;
         #10 encode = 4'b0101;
         #10 $stop;
    end
    
always @(encode)
    begin
        casex(encode)
        4'b1xxx: ns = 3;
        4'bx1xx: ns = 2;
        4'bxx1x: ns = 1;
        4'bxxx1: ns = 0;
        default: ns = 5;
        endcase

        case(encode)
        4'b1xxx: ns2 = 3;
        4'bx1xx: ns2 = 2;
        4'bxx1x: ns2 = 1;
        4'bxxx1: ns2 = 0;
        default: ns2 = 5;
        endcase
    end
    
endmodule