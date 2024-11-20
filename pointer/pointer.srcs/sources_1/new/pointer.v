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
           input wire button_clk,
           input wire swl_reset,
           output reg led_c,
           output wire [7:0] num_seg7
       );
reg[3:0] bed_num;
reg[3:0] i;

initial begin
    led_c=0;
    i=0;
end

always @ (posedge button_clk or posedge swl_reset ) begin
    if(swl_reset) begin
        i<=0;
        led_c<=0;
        bed_num<=4'b0000;
    end
    else begin
        if(i==13) begin
            led_c<=1;
            i<=0;
        end
        else begin
            led_c<=0;
            i<=i+1;
        end
        case (i)
            0 :bed_num<=4'b0000;
            1 :bed_num<=4'b0001;
            2 :bed_num<=4'b0010;
            3 :bed_num<=4'b0011;
            4 :bed_num<=4'b0100;
            5 :bed_num<=4'b0101;
            6 :bed_num<=4'b0110;
            7 :bed_num<=4'b0111;
            8 :bed_num<=4'b1000;
            9 :bed_num<=4'b1001;
            10:bed_num<=4'b1010;
            11:bed_num<=4'b1011;
            12:bed_num<=4'b1100;
            default:
                bed_num<=4'b0000;
        endcase
    end
end

wire [3:0] temp_bad_num;
assign temp_bad_num = bed_num;
BCD bcd(temp_bad_num,num_seg7);

endmodule
