`timescale 1ns / 1ps


module alu(
    input  [7:0]        a,
    input  [7:0]        b,
    output [7:0]  out_and,
    output [7:0]  out_add,
    output [7:0] out_is_zero
);

    assign out_is_zero = (b == 0) ? 1 : 0;
    assign out_and  =  a & b;
    assign out_add  =  a + b;
    
endmodule
