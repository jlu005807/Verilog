`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/28 16:16:38
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
    // Inputs
    reg [31:0] A, B;
    reg [1:0] ALU_OP;
    // Outputs
    wire [31:0] ALU_OUT;
    wire zero;
    // Instantiate DUT
    ALU DUT (
       .OP1(A),
       .OP2(B),
       .ALU_OP(ALU_OP),
       .ALU_OUT(ALU_OUT),
       .zero(zero)
    );
    // Clock
    reg clk;
    always #5 clk = ~clk;
    integer i;
    // Clock Generation
    initial begin
        clk = 0;
        A=0;
        B=0;
        ALU_OP=0;
        for(i=0;i<32;i=i+1) begin
           B=$urandom%100;
           A=B+$urandom%100;
           ALU_OP=$urandom%4;
           #10;
           $display("A=%d, B=%d, ALU_OP=%d, ALU_OUT=%d, zero=%d", A, B, ALU_OP, ALU_OUT, zero);
        end
    end       // 100 MHz clock       

endmodule
