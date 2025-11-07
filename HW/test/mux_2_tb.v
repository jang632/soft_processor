`timescale 1ns / 1ps


module mux_2_tb(
    );
    
    mux_2 uut(
        .i_0 ( i_0 ),
        .i_1 ( i_1 ),
        .sel ( sel ),
        .out ( out )
    );
    
    reg [7:0] i_0, i_1;
    reg sel;
    wire [7:0] out;
    
    initial begin
        i_0 = 6;
        i_1 = 15;
        #20;
        sel = 1;
        #20;
        sel = 0;
    end
    
endmodule
