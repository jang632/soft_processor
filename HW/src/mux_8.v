`timescale 1ns / 1ps


module mux_8(
    input  [7:0] i_0,
    input  [7:0] i_1,
    input  [7:0] i_2,
    input  [7:0] i_3,
    input  [7:0] i_4,
    input  [7:0] i_5,
    input  [7:0] i_6,
    input  [7:0] i_7,
    input  [2:0] sel,
    output [7:0] out
);
    
    assign out = (sel == 0) ? i_0 :
                 (sel == 1) ? i_1 :
                 (sel == 2) ? i_2 :
                 (sel == 3) ? i_3 :
                 (sel == 4) ? i_4 :
                 (sel == 5) ? i_5 :
                 (sel == 6) ? i_6 :
                 (sel == 7) ? i_7 : 8'bz;
    
endmodule
