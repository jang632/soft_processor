`timescale 1ns / 1ps


module jump_condition_tb(
    );
    
    jump_condition uut(
        .cmp_res    ( cmp_res ),
        .pc_op      ( pc_op ),
        .pc_mux_sel ( pc_mux_sel )
    );
    
    integer i,j;
    reg [7:0]cmp_res;
    reg [1:0]pc_op;
    wire pc_mux_sel;
    
    initial
    begin
        for(i=0;i<2;i=i+1) begin
            for(j=0;j<4;j=j+1) begin
                cmp_res = i;
                pc_op = j;
                #20;
            end
        end
    end
    
endmodule
