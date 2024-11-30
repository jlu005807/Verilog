`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/30 14:42:30
// Design Name: 
// Module Name: Control_tb
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


module Control_tb;
reg clk;
reg[5:0] func;
reg[5:0] op_code;

wire [1:0] ALU_ctrl;
wire RegDst;
wire RegWrite;
wire ALUSrc;
wire PCsrc;
wire MemRead;
wire MemWrite;
wire MemtoReg;

wire[5:0] ALU_op;

integer i;
always #5 clk=~clk; // clock generator
reg [5:0] codes[6:0];
reg[5:0] funcs[6:0];
Control DUT(op_code,RegDst,RegWrite,ALUSrc,PCsrc,MemRead,MemWrite,MemtoReg,ALU_op);
ALU_Control ALU_DUT(op_code,func,ALU_ctrl);
initial begin
   clk=0;
   op_code = 6'b000000;
   func = funcs[0];
   codes[0] = 6'b000000;
   codes[1] = 6'b000000; 
   codes[2] = 6'b001101; 
   codes[3] = 6'b001111; 
   codes[4] = 6'b000101;
   codes[5] = 6'b100011; 
   codes[6] = 6'b101011;
   funcs[0] = 6'b100001;
   funcs[1] = 6'b100010;
   funcs[2] = 6'b100011;
   funcs[3] = 6'b100100;
   funcs[4] = 6'b100101;
   funcs[5] = 6'b100110;
   funcs[6] = 6'b100111;
   #10;
   for (i =0 ;i<7 ;i=i+1  ) begin
        op_code = codes[i];
        func = funcs[i];
        $display("op_code = %b, func = %b",op_code,func);
        #10;
   end    
end

endmodule
