`timescale 1ns / 1ps


module register_8bit_tb
    (
    );
    
    reg clk, ce;
    reg [7:0] di;
    wire [7:0] do;
    
    register_8bit uut
    (
        .clk ( clk ),
        .ce  ( ce ),
        .di  ( di ),
        .DO  ( do )
    );
    
    initial
    begin
       clk = 1'b0;
       forever
       begin
            #10 clk = ~clk;
       end 
    end
    
    initial
    begin
        ce = 1'b1;
        di = 17;
        #40;
        ce = 1'b0;
        di = 33;
        #40;
        ce = 1'b1;
        di = 89;
        #100;
    end
    
endmodule
