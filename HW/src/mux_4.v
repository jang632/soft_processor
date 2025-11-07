`timescale 1ns / 1ps


module mux_4(
    input  [7:0] i_0,
    input  [7:0] i_1,
    input  [7:0] i_2,
    input  [7:0] i_3,
    input  [1:0] sel,
    output [7:0] out
);
    
    assign out = (sel == 0) ? i_0 :
                 (sel == 1) ? i_1 :
                 (sel == 2) ? i_2 :
                 (sel == 3) ? i_3 : 8'bz;
    
endmodule
