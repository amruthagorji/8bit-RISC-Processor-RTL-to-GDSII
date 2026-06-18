`timescale 1ns / 1ps

module fetch(
    input clk,
    input rst,

    output [7:0] pc,
    output [15:0] instruction
);

    wire [7:0] pc_wire;
    wire [7:0] next_pc;

    assign next_pc = pc_wire + 1;

    pc pc_inst(
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc_wire)
    );

    instruc_mem imem_inst(
        .address(pc_wire),
        .instruction(instruction)
    );

    assign pc = pc_wire;

endmodule