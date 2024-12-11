`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/05 14:09:35
// Design Name: 
// Module Name: PC
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


module PC(
    input wire clk,
    input wire rst,
    input wire [31:0] pc,
    output wire [31:0] pc_out,
    output wire [19:0] ram_addr
    );
reg [31:0]temp_pc;
always @(posedge clk) begin
    if(rst)
      temp_pc=32'b0;
    else 
      temp_pc=pc;
end
    
assign pc_out = temp_pc;
assign ram_addr = temp_pc[21:2];
endmodule
