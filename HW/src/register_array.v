`timescale 1ns / 1ps


module register_array(
    input  clk,
    input  ce0, ce1, ce2, ce3, ce4, ce5, ce6,
    input  [7:0] di0, di1, di2, di3, di4, di5, di6,
    output [7:0] do0, do1, do2, do3, do4, do5, do6
);
    
    register_8bit u_r0 (
        .clk ( clk ),
        .ce  ( ce0 ),
        .di  ( di0 ),
        .do  ( do0 )
    );

    register_8bit u_r1 (
        .clk ( clk ),
        .ce  ( ce1 ),
        .di  ( di1 ),
        .do  ( do1 )
    );

    register_8bit u_r2 (
        .clk ( clk ),
        .ce  ( ce2 ),
        .di  ( di2 ),
        .do  ( do2 )
    );

    register_8bit u_r3 (
        .clk ( clk ),
        .ce  ( ce3 ),
        .di  ( di3 ),
        .do  ( do3 )
    );

    register_8bit u_r4 (
        .clk ( clk ),
        .ce  ( ce4 ),
        .di  ( di4 ),
        .do  ( do4 )
    );

    register_8bit u_r5 (
        .clk ( clk ),
        .ce  ( ce5 ),
        .di  ( di5 ),
        .do  ( do5 )
    );

    register_8bit u_r6 (
        .clk ( clk  ),
        .ce  ( 1'b0 ),
        .di  ( di6  ),
        .do  ( do6  )
    );

   
endmodule
