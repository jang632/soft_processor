`timescale 1ns / 10ps


module soft_processor_stim(
    input        clk,
    output [7:0] gpi
);

     clock_divider u_clk_div(
        .clk     ( clk ),
        .out_clk ( clk_out )
    );

    wire clk_out;
    reg [7:0] gpi = 0;
    integer count = 0;
    
    always @ (posedge clk_out) begin
         count <= count + 1;
         if( count == 200) begin
            gpi <= 8'b00000001;
         end
         else if( count == 400 ) begin
            gpi <= 8'b00000010;
         end
         else if( count == 600 ) begin
            gpi <= 8'b00000001;
         end
         else if( count == 800 ) begin
            gpi <= 8'b00000010;
            count <= 0;
         end
     end
endmodule
