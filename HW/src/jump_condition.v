`timescale 1ns / 1ps


module jump_condition(
    input [7:0] cmp_res,
    input [1:0]   pc_op,
    output    pc_mux_sel
);
    
    reg pc_mux_sel_i;
    assign pc_mux_sel = pc_mux_sel_i;
        
    always @(*) begin
       case(pc_op)
            //no jump
            2'b00: pc_mux_sel_i = 1'b1;                
            //jmp jmpi
            2'b01: pc_mux_sel_i = 1'b0;               
            //jz
            2'b10: pc_mux_sel_i = (cmp_res == 8'd1) ? 1'b0 : 1'b1;                
            //jnz
            2'b11: pc_mux_sel_i = (cmp_res == 8'd0) ? 1'b0 : 1'b1;
            //default no jump  
            default: pc_mux_sel_i = 1'b1; 
       endcase
    end
    
endmodule
