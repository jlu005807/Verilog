`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/30 13:35:39
// Design Name:
// Module Name: Control
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


module Control( // 控制单元模块
           input wire [5:0] OP_code, // 操作码输�?
           output wire RegDst, // 寄存器目标�?�择信号
           output wire RegWrite, // 寄存器写使能信号
           output wire ALUsrc, // ALU源�?�择信号
           output wire PCsrc, // 程序计数器源选择信号
           output wire MemRead, // 存储器读使能信号
           output wire MemWrite, // 存储器写使能信号
           output wire MemtoReg, // 存储器数据�?�入寄存器�?�择信号
           output wire [2:0] ALUop // ALU操作�?
       );
// always @(*)begin
//                 case (OP_code)
//                     6'b000000: begin// R-type
//                         ReadRe = 1'b1; // 寄存器目标�?�择为寄存器B
//                         RegWrite = 1'b1; // 寄存器写使能
//                         ALUSrc = 1'b0; // ALU源�?�择为寄存器B
//                         PCsrc = 1'b0; // 程序计数器源选择为PC+4
//                         MemRead = 1'b0; // 存储器读使能
//                         MemWrite = 1'b0; // 存储器写使能
//                         MemtoReg = 1'b1; // 存储器数据�?�入寄存器�?�择为无
//                     end
//                     6'b001101 || 6'b001111: begin
//                         ReadRe = 1'b0; // 寄存器目标�?�择为寄存器A
//                         RegWrite = 1'b1; // 寄存器写使能
//                         ALUSrc = 1'b1; // ALU源�?�择为寄存器A
//                         PCsrc = 1'b0; // 程序计数器源选择为PC+4
//                         MemRead = 1'b0; // 存储器读使能
//                         MemWrite = 1'b0; // 存储器写使能
//                         MemtoReg = 1'b1; // 存储器数据�?�入寄存器�?�择为无
//                     end
//                     6'b000101: begin//bne
//                         ReadRe = 1'b0; // 寄存器目标�?�择为寄存器A
//                         RegWrite = 1'b0; // 寄存器写使能
//                         ALUSrc = 1'b0; // ALU源�?�择为寄存器A
//                         PCsrc = 1'b1; // 程序计数器源选择为PC+1
//                         MemRead = 1'b0; // 存储器读使能
//                         MemWrite = 1'b0; // 存储器写使能
//                         MemtoReg = 1'b0; // 存储器数据�?�入寄存器�?�择为无
//                     end
//                     6'b100011 || 6'b101001: begin
//                         ReadRe = 1'b0; // 寄存器目标�?�择为寄存器B
//                         RegWrite = ~OP_code[3];
//                         ALUSrc = 1'b1; // ALU源�?�择为寄存器B
//                         PCsrc = 1'b0; // 程序计数器源选择为PC+4
//                         MemRead = ~OP_code[3]; // 存储器读使能
//                         MemWrite = OP_code[3]; // 存储器写使能
//                         MemtoReg = 1'b0; // 存储器数据�?�入寄存器�?�择为寄存器B
//                 endcase

//             end

assign RegDst = ~OP_code[0]; // 寄存器目标�?�择为寄存器B
assign RegWrite = ~(OP_code[2] ^ OP_code[3]); // 寄存器写使能
assign ALUsrc = OP_code[5]||OP_code[3]; // ALU源�?�择为寄存器B
assign PCsrc = ~OP_code[3]&&OP_code[2]; // 程序计数器源选择为PC+4
assign MemRead = OP_code[5]&&~OP_code[3]; // 存储器读使能
assign MemWrite = OP_code[5]&&OP_code[3]; // 存储器写使能
assign MemtoReg = ~OP_code[0]||(OP_code[3]&&OP_code[2]); // 存储器数据�?�入寄存器�?�择为寄存器B
assign ALUop =OP_code[3:1] ; // ALU操作�?

endmodule // 控制单元模块结束