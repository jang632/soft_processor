`timescale 1ns / 1ps


module mux_8_tb
    (
    );
    
    reg [7:0]i_0;
    reg [7:0]i_1;
    reg [7:0]i_2;
    reg [7:0]i_3;
    reg [7:0]i_4;
    reg [7:0]i_5;
    reg [7:0]i_6;
    reg [7:0]i_7;
    
    reg [2:0] sel;
    wire [7:0] out;
    
    mux_8 uut(
        .i_0 ( i_0 ),
        .i_1 ( i_1 ),
        .i_2 ( i_2 ),
        .i_3 ( i_3 ),
        .i_4 ( i_4 ),
        .i_5 ( i_5 ),
        .i_6 ( i_6 ),
        .i_7 ( i_7 ),
        .sel ( sel ),
        .out ( out )
    );
    
    integer i;
    
    initial
    begin
        
        i_0 = 51;
        i_1 = 5;
        i_2 = 17;
        i_3 = 44;
        i_4 = 87;
        i_5 = 32;
        i_6 = 98;
        i_7 = 12;
               
        for(i=0; i<8; i=i+1)
        begin
            sel = i;
            #20;
        end
    end
        
        
    
endmodule
