`timescale 1ns / 1ps


module alu_tb
    (
    );
    
    reg [7:0] a, b;
    wire [7:0] alu_and, alu_add, alu_is_zero;
    
    alu uut(
        .a           ( a ),
        .b           ( b ),
        .out_and     ( alu_and ),
        .out_add     ( alu_add ),
        .out_is_zero ( alu_is_zero )
    );
    
    initial
    begin
        
        a = 8'b00110100;
        b = 8'b10010101;
        if(alu_and !== (a&b)) begin
            $display("AND failed");
        end
        
        #50;
        
        a = 6;
        b = 56;
        if(alu_add !== (a+b)) begin
            $display("ADD failed");
        end
        
        #50;
        
        a = 0;
        b = 122;
        if(alu_is_zero !== 1 && a == 0) begin
            $display("IS ZERO failed");
        end
    end
    
endmodule
