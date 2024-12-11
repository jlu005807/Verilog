`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/28 13:42:08
// Design Name:
// Module Name: regfile
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

//32*32 register file
module regfile(
           input wire clk, // Clock
           input wire write_enable, // write_sign
           input [4:0] rs,// read_address0
           input [4:0] rt,// read_address1
           input [4:0] rd,// write_address
           input [31:0] data_in, // write_data
           output reg [31:0] read_data1 ,// data_out1
           output reg [31:0] read_data2 // data_out2
       );

reg [31:0] regfile [31:0]; // register file

integer i;
initial begin
     for (i = 0 ;i<32 ;i=i+1 ) begin
        regfile[i] = 0;
     end
end

always @(posedge clk) begin
    if(write_enable) begin
        regfile[rd] = data_in;
    end
end


always @(*) begin
    read_data1 <= regfile[rs];
    read_data2 <= regfile[rt];
end

endmodule
