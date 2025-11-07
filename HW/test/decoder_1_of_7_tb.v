`timescale 1ns / 1ps


module decoder_1_of_7_tb
    (
    );
    
    reg [2:0] sel;
    wire [6:0] one_hot;
    
    decoder_1_of_7 uut
    (
        .sel     ( sel ),
        .hot_one ( one_hot )
    );
    
    integer i;
    
    initial begin
        for(i=0;i<7;i=i+1) begin
            sel = i;
            #20;
        end
    end
    
endmodule
