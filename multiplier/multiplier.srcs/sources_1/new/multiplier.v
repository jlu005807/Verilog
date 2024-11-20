`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/20 21:06:57
// Design Name:
// Module Name: multiplier
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module multiplier(
           input wire button_clk,
           input wire reset,
           input wire [7:0] mult_op1,
           input wire [7:0] mult_op2,
           output wire [7:0] mult_product,
           output wire [7:0] num_seg7
       );

reg [7:0] op1_comp;
reg [7:0] op2_comp;
reg [15:0] now_product;

initial fork
    if(mult_op1[7]==1'b1)
        op1_comp = ~mult_op1 + 1'b1;
    else
        op1_comp = mult_op1;
    if(mult_op2[7]==1'b1)
        op2_comp = ~mult_op2 + 1'b1;
    else
        op2_comp = mult_op2;
    now_product = 16'b0000000000000000;

join


always @(posedge button_clk or posedge reset) begin
    if(reset) begin
        now_product = 16'b0000000000000000;
        op1_comp = mult_op1;
        op2_comp = mult_op2;
    end
    else begin
        if (op2_comp[0] == 1'b1)
            now_product = op1_comp + now_product;
        op2_comp = op2_comp >> 1;
        now_product = now_product << 1;
    end
end

pointer counter(button_clk,reset,num_seg7);

assign mult_product = {mult_op1[7]^mult_op2[7],now_product[11:5]};

endmodule


