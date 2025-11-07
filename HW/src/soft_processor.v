    `timescale 1ns / 1ps
    
    
module soft_processor(
    input        clk,
    input  [7:0] gpi,
    output [7:0] gpo
);
        
    wire [6:0] one_hot;
    wire [7:0] di;
    wire [7:0] alu_mux_out;       
    wire [7:0] rx;
    wire [7:0] ry;
    wire [7:0] ry_imm_mux;       
    wire [7:0] do0,do1,do2,do3,do4,do5,do6,do7,do8;        
    wire [7:0] alu_and, alu_add, alu_is_zero;        
    wire [7:0] di_pc;
    wire [7:0] do_pc;       
    wire [7:0]do_pc_inc;       
    wire pc_mux_sel;        
    wire [31:0]instruction;       
    wire clk_out;
        
    assign do_pc_inc = do_pc + 1;
    assign gpo = do3;
    
    clock_divider u_clk_div(
        .clk     ( clk ),
        .out_clk ( clk_out )
    );

    blk_mem_gen_1 u_program_mem(
        .clka  ( clk_out ),
        .wea   ( 1'b0 ),
        .addra ( do_pc ),
        .dina  ( 32'b0 ),
        .douta ( instruction )
    );

    jump_condition u_jump_condition(
        .cmp_res    ( alu_is_zero ),
        .pc_op      ( instruction[25:24] ),
        .pc_mux_sel ( pc_mux_sel )
    );

    register_8bit u_r7_pc(
        .clk ( clk_out ),
        .ce  ( 1'b1 ),
        .di  ( di_pc ),
        .do  ( do_pc )  
    );

    mux_2 u_mux_2_pc(
        .i_0 ( alu_mux_out ),
        .i_1 ( do_pc_inc ),
        .sel ( pc_mux_sel ),
        .out ( di_pc )
    );

    alu u_alu(
        .a           ( ry_imm_mux ),
        .b           ( rx ),
        .out_and     ( alu_and ),
        .out_add     ( alu_add ),
        .out_is_zero ( alu_is_zero )
    );

    mux_4 u_mux_4_alu_op(
        .i_0 ( alu_and ),
        .i_1 ( alu_add ),
        .i_2 ( alu_is_zero ),
        .i_3 ( ry_imm_mux ),
        .sel ( instruction[21:20] ),
        .out ( alu_mux_out )
    );

    decoder_1_of_7 u_decoder_d_op(
        .sel     ( instruction[10:8] ),
        .one_hot ( one_hot )
    );

    mux_8 u_mux_8_rx_op(
        .i_0 ( do0 ),
        .i_1 ( do1 ),
        .i_2 ( do2 ),
        .i_3 ( do3 ),
        .i_4 ( do4 ),
        .i_5 ( do5 ),
        .i_6 ( do6 ),
        .i_7 ( do7 ),
        .sel ( instruction[18:16] ),
        .out ( rx )
    );
    
    mux_8 u_mux_8_ry_op(
        .i_0 ( do0 ),
        .i_1 ( do1 ),
        .i_2 ( do2 ),
        .i_3 ( do3 ),
        .i_4 ( do4 ),
        .i_5 ( do5 ),
        .i_6 ( do6 ),
        .i_7 ( do7 ),
        .sel ( instruction[14:12] ),
        .out ( ry )
    );


    mux_2 u_mux_2_rd_op(
        .i_0 ( alu_mux_out ),
        .i_1 ( 8'b0 ),
        .sel ( instruction[11] ),
        .out ( di )
    );

    mux_2 u_mux_2_imm_op(
        .i_0 ( ry ),
        .i_1 ( instruction[7:0] ),
        .sel ( instruction[15] ),
        .out ( ry_imm_mux )
    );
   
    register_array u_register_array(
        .clk ( clk_out ),
        .ce0 ( one_hot[0] ), .ce1( one_hot[1] ), .ce2( one_hot[2] ), .ce3( one_hot[3] ), .ce4( 1'b1 ), .ce5( one_hot[5] ), .ce6( 1'b1 ),
        .di0 ( di ), .di1 ( di ), .di2 ( di ), .di3 ( di ), .di4 ( gpi ), .di5 ( di ), .di6 ( 8'b0 ),
        .do0 ( do0 ), .do1 ( do1 ), .do2( do2 ), .do3 ( do3 ), .do4 ( do4 ), .do5( do5 ), .do6 ( do6 )
    );
   
endmodule
