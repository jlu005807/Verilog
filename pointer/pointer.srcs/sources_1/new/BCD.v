`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/20 10:13:31
// Design Name: 
// Module Name: BCD
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

module BCD(
           input [3:0] bed_num,
           output reg[7:0] bcd_seg7//shift_reg
       );

always @(*) begin
    case (bed_num)
        4'b0000: bcd_seg7 <= 8'b11111100;
        4'b0001: bcd_seg7 <= 8'b01100000;
        4'b0010: bcd_seg7 <= 8'b11011010;
        4'b0011: bcd_seg7 <= 8'b11110010;
        4'b0100: bcd_seg7 <= 8'b01100110;
        4'b0101: bcd_seg7 <= 8'b10110110;
        4'b0110: bcd_seg7 <= 8'b10111110;
        4'b0111: bcd_seg7 <= 8'b11100000;
        4'b1000: bcd_seg7 <= 8'b11111110;
        4'b1001: bcd_seg7 <= 8'b11110110;
        4'b1010: bcd_seg7 <= 8'b11101110;
        4'b1011: bcd_seg7 <= 8'b00111110;
        4'b1100: bcd_seg7 <= 8'b10011100;
        default:
            bcd_seg7 <= 8'b00000000;
    endcase
end
endmodule
