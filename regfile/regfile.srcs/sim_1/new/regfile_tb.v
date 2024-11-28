`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/11/28 13:53:04
// Design Name:
// Module Name: regfile_tb
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


module regfile_tb;
reg clk;// Clock
reg write_enable; // write_sign
reg [4:0] rs;// read_address0
reg [4:0] rt;// read_address1
reg [4:0] rd;// write_address
reg [31:0] data_in; // write_data
wire [31:0] read_data1;// data_out1
wire[31:0] read_data2; // data_out2

regfile regfile_inst(
            .clk(clk),
            .write_enable(write_enable),
            .rs(rs),
            .rt(rt),
            .rd(rd),
            .data_in(data_in),
            .read_data1(read_data1),
            .read_data2(read_data2)
        );

always #5 begin
    clk = ~clk;
end

integer i;

initial begin
    // Initialize the clock
    clk = 0;
    // Initialize the write_enable
    write_enable = 0;
    // Initialize the read_address0
    rs = 0;
    // Initialize the read_address1
    rt = 0;
    // Initialize the write_address
    rd = 0;
    // Initialize the write_data
    data_in = 0;


    #10;
    // Write data to the registers
    write_enable=1;
    for (i = 0 ;i<32 ;i=i+1 ) begin
        rd=rd+1;
        data_in=rd;
        #10;
    end
    write_enable=0;

    #10;
    // Read data from the registers
    for (i = 0 ;i<31 ;i=i+1 ) begin
        rs=i;
        rt=rs+1;
        #10;
        $display("Read data1: %d, Read data2: %d", read_data1, read_data2);
    end

end

endmodule
