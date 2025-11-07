`timescale 1ns / 1ps


module register_8bit(
    input       clk,
    input        ce,
    input  [7:0] di,
    output [7:0] do
 );
    
    reg [7:0] r_data = 0;
    
    always@(posedge clk) begin
        if(ce)
            r_data <= di;
        else
            r_data <= r_data;
    end
     
    assign do = r_data;
    
endmodule
