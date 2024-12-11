module EXT16TO32(
    input [15:0] imm_data, 
    output [31:0] out
    );
//符号位扩展，ben可能跳转到前面，即立即数为负数
assign out = {{16{imm_data[15]}}, imm_data[15:0]};

endmodule
