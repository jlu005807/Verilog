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
           input dp,
           input [3:0] bed_num,
           output reg[7:0] num_seg7//shift_reg
       );

always @(*) begin
    case (bed_num)
        4'b0000: num_seg7 <= {7'b1111110,dp};
        4'b0001: num_seg7 <= {7'b0110000,dp};
        4'b0010: num_seg7 <= {7'b1101101,dp};
        4'b0011: num_seg7 <= {7'b1111001,dp};
        4'b0100: num_seg7 <= {7'b0110011,dp};
        4'b0101: num_seg7 <= {7'b1011011,dp};
        4'b0110: num_seg7 <= {7'b1011111,dp};
        4'b0111: num_seg7 <= {7'b1110000,dp};
        4'b1000: num_seg7 <= {7'b1111111,dp};
        4'b1001: num_seg7 <= {7'b1110011,dp};
        default:
            num_seg7 <= {7'b0000000,dp};
    endcase
end

endmodule
