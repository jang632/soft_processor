`timescale 1ns / 10ps


module soft_processor_tb
    (
    );
    
    reg clk;
    wire [7:0] gpi;
    wire [7:0] gpo;
    
    soft_processor uut(
        .clk ( clk ),
        .gpi ( gpi ),
        .gpo ( gpo )
    );
    
    soft_processor_stim stim(
        .clk ( clk ),
        .gpi ( gpi )
    );
    
    initial begin
        clk = 1'b0;
        forever begin
          #10 clk = ~clk;
        end
    end
 
        
endmodule
