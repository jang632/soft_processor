`timescale 1ns / 1ps


module clock_divider(
    input      clk,
    output out_clk
);

    reg n1 = 0;
    reg [31:0] div_cnt = 0;

    assign out_clk = n1;
    
    always @(posedge clk) begin
        if(div_cnt == 32'd10) div_cnt <= 32'd0;
        else div_cnt <= div_cnt + 32'd1;
    end
    
    always @(posedge clk) begin
        if((div_cnt == 0) || (div_cnt == 32'd5)) n1 <= ~n1;
        else n1 <= n1;
    end
    
endmodule