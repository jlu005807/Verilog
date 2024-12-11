`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/12/05 14:29:21
// Design Name:
// Module Name: m_CPU
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


module m_CPU(
           input wire clk,
           input wire rst,
           input wire[31:0] base_ram_data,
           output wire[19:0] base_ram_addr,
           output wire[3:0] base_ram_be_n,
           output wire base_ram_ce_n,
           output wire base_ram_oe_n,
           output wire base_ram_we_n,
           inout wire[31:0] ext_ram_data,
           output wire[19:0] ext_ram_addr,
           output wire[3:0] ext_ram_be_n,
           output wire ext_ram_ce_n,
           output wire ext_ram_oe_n,
           output wire ext_ram_we_n
       );

//IM
assign base_ram_be_n=4'b0000;
assign base_ram_ce_n=1'b0;
assign base_ram_oe_n=1'b0;
assign base_ram_we_n=1'b1;

integer i;
initial begin
    i=-1;
end

//PC
wire[31:0] next_pc;
wire[31:0] PC_out;
PC pc(
       .clk(clk),
       .rst(rst),
       .pc(next_pc),
       .pc_out(PC_out),
       .ram_addr(base_ram_addr)
   );


//Control
wire [31:0] instruction;
assign instruction = base_ram_data;

wire RegDst;
wire RegWrite;
wire ALUsrc;
wire PCsrc;
wire MemRead;
wire MemWrite;
wire MemtoReg;
wire [2:0] ALUop;

Control ctrl(
            .OP_code(instruction[31:26]),
            .RegDst(RegDst),
            .RegWrite(RegWrite),
            .ALUsrc(ALUsrc),
            .PCsrc(PCsrc),
            .MemRead(MemRead),
            .MemWrite(MemWrite),
            .MemtoReg(MemtoReg),
            .ALUop(ALUop)
        );

//ALU Control
wire[1:0] ALU_ctrl;
ALU_Control aluctrl(
                .ALU_op(ALUop),
                .func(instruction[5:0]),
                .ALU_ctrl(ALU_ctrl)
            );

//Regfile
wire[31:0] reg_write_data;
wire[31:0] read_data1;
wire[31:0] read_data2;
wire[4:0] write_register;//rd

//mux0
assign write_register = (RegDst==1)? instruction[15:11] : instruction[20:16];

regfile regfile(
            .clk(clk),
            .write_enable(RegWrite),
            .rs(instruction[25:21]),
            .rt(instruction[20:16]),
            .rd(write_register),
            .data_in(reg_write_data),
            .read_data1(read_data1),
            .read_data2(read_data2)
        );

//ex16to32
wire[31:0] imm_data;

EXT16TO32 ex16to32(
              .imm_data(instruction[15:0]),
              .out(imm_data)
          );


//ALU
wire[31:0] ALU_op1;
wire[31:0] ALU_op2;
wire[31:0] ALU_result;
wire zero;
assign ALU_op1 = read_data1;
//mux1
assign ALU_op2 = (ALUsrc==1)? imm_data : read_data2;

ALU alu(
        .ALU_OP(ALU_ctrl),
        .OP1(ALU_op1),
        .OP2(ALU_op2),
        .ALU_OUT(ALU_result),
        .zero(zero)
    );



//DM
wire dm_read_data;
assign ext_ram_addr = ALU_result[21:2];
assign ext_ram_be_n = 4'b0000;
assign ext_ram_ce_n = ~(MemRead | MemWrite);
assign ext_ram_oe_n = ~MemRead;
assign ext_ram_we_n = ~MemWrite;


//mux2
inout_top dm(
    .I_data_in(read_data2),
    .IO_data(ext_ram_data),
    .O_data_out(dm_read_data),
    .control(MemWrite)
);

assign reg_write_data = (MemtoReg==0)? ext_ram_data : ALU_result;

// assign reg_write_data = (MemtoReg==0)? ext_ram_data : ALU_result;
// assign ext_ram_data = (MemWrite == 1'b1) ? read_data2 : 32'bz;



//bne
//pc_plus4
wire[31:0] pc_plus4;
assign pc_plus4 = (PC_out + 4);

wire[31:0] bne_addr;
assign bne_addr = ((imm_data << 2) + pc_plus4);



//mux3
assign next_pc = (PCsrc==1'b1 && zero==1'b0)? bne_addr : pc_plus4;

always @(PC_out) begin
    $display("i:%d",i);
    i=i+1;
    $display("PC:%h,instruction:%h",PC_out,instruction);
    $display("instruction[31:26]:%b,rs:%b,rt:%b,rd:%b,func:%b,imm:%b",instruction[31:26],instruction[25:21],instruction[20:16],write_register,instruction[5:0],instruction[15:0]);
    $display("read_data1:%h,read_data2:%h,reg_write_data:%h,dm_read_data:%h",read_data1,read_data2,reg_write_data,dm_read_data);
    $display("ALU_op1:%h,ALU_op2:%h,ALU_result:%h,zero:%h,PCsrc:%b,Memtoreg:%b,bne_addr:%h\n",ALU_op1,ALU_op2,ALU_result,zero,PCsrc,MemtoReg,bne_addr);
end

endmodule
