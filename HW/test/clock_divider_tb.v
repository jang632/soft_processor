`timescale 1ns / 1ps


module clock_divider_tb(
    );
    
    reg clk;
    wire out_clk;
    
    clock_divider uut
    (
        .clk(clk),
        .out_clk(out_clk)
    );
    
    initial begin
        clk = 1'b0;
        forever begin
           #10 clk = ~clk;
        end
    end
    
    
endmodule
