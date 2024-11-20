
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/19 22:22:57
// Design Name: 
// Module Name: mulx4_2
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
`timescale 1ns / 1ps

module mutx4_2(

    input sw6_a1,

    input sw5_a0,

    input sw4_d4,

    input sw3_d3,

    input sw2_d2,

    input sw1_d1,

    output led8_out

    );

    assign led8_out = sw6_a1&sw5_a0&sw4_d4 | (!sw6_a1)&sw5_a0&sw3_d3 | sw6_a1&(!sw5_a0)&sw2_d2 | (!sw6_a1) & (!sw5_a0)&sw1_d1;

endmodule


