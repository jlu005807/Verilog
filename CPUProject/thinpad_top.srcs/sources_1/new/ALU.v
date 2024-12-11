`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/28 16:16:10
// Design Name:
// Module Name: ALU
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


module ALU(
           input wire [1:0] ALU_OP,
           input wire [31:0] OP1,
           input wire [31:0] OP2,
           output wire [31:0] ALU_OUT,
           output wire zero
       );
       reg[31:0] result;
       always @(*) begin
        case (ALU_OP)
            2'b00: result = OP1 + OP2;
            2'b01: result = OP1 - OP2;
            2'b10: result = OP1 | OP2;
            2'b11: result = OP2<<16;
            default: 
                result = 0; 
        endcase
       end   
       assign ALU_OUT = result;
       assign zero = (result == 0)? 1'b1 : 1'b0;
endmodule
