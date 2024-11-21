`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/20 08:14:31
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
           output reg[7:0] num_seg7//shift_reg
       );

always @(*) begin
    case (bed_num)
        4'b0000: num_seg7 <= {8'b11111100};
        4'b0001: num_seg7 <= {8'b01100000};
        4'b0010: num_seg7 <= {8'b11011010};
        4'b0011: num_seg7 <= {8'b11110010};
        4'b0100: num_seg7 <= {8'b01100110};
        4'b0101: num_seg7 <= {8'b10110110};
        4'b0110: num_seg7 <= {8'b10111110};
        4'b0111: num_seg7 <= {8'b11100000};
        4'b1000: num_seg7 <= {8'b11111110};
        4'b1001: num_seg7 <= {8'b11100110};
        4'b1010: num_seg7 <= {8'b11101110};
        4'b1011: num_seg7 <= {8'b00111110};
        4'b1100: num_seg7 <= {8'b11111000};
        4'b1101: num_seg7 <= {8'b11110000};
        4'b1110: num_seg7 <= {8'b10001100};
        4'b1111: num_seg7 <= {8'b11110110};
        default:
            num_seg7 <= {8'b00000000};
    endcase
end

endmodule
