`timescale 1ns / 1ps

module decoder_tb;

    reg [15:0] instruction;

    wire [3:0] opcode;
    wire [2:0] rs1;
    wire [2:0] rs2;
    wire [2:0] rd;

    decoder uut(
        .instruction(instruction),
        .opcode(opcode),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd)
    );

    initial begin

        instruction = 16'b0000_001_010_011_000;
        #10;

        instruction = 16'b0001_011_100_101_000;
        #10;

        instruction = 16'b0010_111_000_001_000;
        #10;

        $finish;

    end

endmodule