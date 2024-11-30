`timescale 1ns / 1ps

module ALU_Control(
           input wire [5:0] ALU_op,
           input wire [5:0] func,
           output reg [1:0] ALU_ctrl
       );
always @(*) begin
    case (ALU_op)
        6'b000000:begin
            case (func[0])
                1'b1: ALU_ctrl <= 2'b00; // ADD
                1'b0: ALU_ctrl <= 2'b01; // SUB
            endcase
        end // R-type
        6'b100011 ||6'b101011: ALU_ctrl <= 2'b00;
        6'b000101: ALU_ctrl <= 2'b01;
        6'b001101: ALU_ctrl <= 2'b10;
        6'b001111: ALU_ctrl <= 2'b11;
        default:
            ALU_ctrl <= 2'b00;   // default is ADD
    endcase
end

endmodule
