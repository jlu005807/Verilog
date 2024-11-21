`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/21 13:46:36
// Design Name:
// Module Name: RAM
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


module RAM(
           input rowl_clk,//row address clock
           input ram_en, //enable signal
           input r_en, //read enable signal,high when read operation is required,low when write operation is required
           input reset, //reset signal,high when reset is required
           input [1:0] addr, //address input
           input [3:0] data_in, //data input
           output [1:0] leds, //led output
           output [7:0] dpy0//data output to display
       );
reg[3:0] ram[3:0];
reg[3:0] num;
reg[1:0] temp_leds;
always @(posedge rowl_clk or posedge reset) begin
    if(reset) fork
        ram[0] <= 4'b0000;
        ram[1] <= 4'b0000;
        ram[2] <= 4'b0000;
        ram[3] <= 4'b0000;
        num <= 4'b0000;
    join
    else if(ram_en) begin
        if(!r_en) begin
            num <= ram[addr];
        end
        else begin
            ram[addr] <= data_in;
            num <= data_in;
        end
        temp_leds <= addr;
    end
end

assign leds = temp_leds;
BCD bcd(num,dpy0);

endmodule
