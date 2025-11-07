`timescale 1ns / 1ps


module mux_2(
    input  [7:0] i_0,
    input  [7:0] i_1,
    input        sel,
    output [7:0] out
);
    
    assign out = (sel == 0) ? i_0 :
                 (sel == 1) ? i_1 : 8'bz;
                                    
endmodule
