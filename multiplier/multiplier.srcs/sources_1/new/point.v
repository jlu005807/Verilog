`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/20 09:57:35
// Design Name:
// Module Name: pointer
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



module pointer(
           input wire clk,
           input wire swl_reset,
           output wire [7:0] seg7
       );
       
reg[3:0] bed_num;
reg[3:0] i;


initial fork
    i=3;
    bed_num=4'b1000;
join

always @ (posedge clk or posedge swl_reset ) begin
    if(swl_reset) fork
        i<=3;
        bed_num<=4'b1000;
    join
    else begin
        i<=i-1;
        case (i)
            0 :bed_num<=4'b0000;
            1 :bed_num<=4'b0001;
            2 :bed_num<=4'b0010;
            3 :bed_num<=4'b0011;
            default:
                bed_num<=4'b0000;
        endcase
    end
end
BCD bcd(bed_num,seg7);

endmodule