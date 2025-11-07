`timescale 1ns / 1ps


module decoder_1_of_7(
    input  [2:0] sel,
    output [6:0] one_hot
);

    assign one_hot = (sel == 0) ? 7'b0000001 :
                     (sel == 1) ? 7'b0000010 :
                     (sel == 2) ? 7'b0000100 : 
                     (sel == 3) ? 7'b0001000 :
                     (sel == 4) ? 7'b0010000 : 
                     (sel == 5) ? 7'b0100000 :
                     (sel == 6) ? 7'b1000000 : 7'b1000000;
    
endmodule
