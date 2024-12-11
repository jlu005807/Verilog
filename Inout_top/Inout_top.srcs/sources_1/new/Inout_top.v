`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/12/06 23:05:19
// Design Name: 
// Module Name: Inout_top
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


module Inout_top(

    input wire I_data_in,//input data to IO_data

    inout wire IO_data,//inout data

    output wire O_data_out, //output data from IO_data

    input wire control//control signal to select between input and output data
    );

    //assigning input data to IO_data and output data from IO_data based on control signal
    assign IO_data = (control == 1'b0)? I_data_in : 1'bz;
    assign O_data_out = IO_data;
endmodule
