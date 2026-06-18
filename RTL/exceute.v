`timescale 1ns / 1ps

module execute_unit(
    input clk,
    input rst,
    input [15:0] instruction,

    output [7:0] alu_result,
    output zero,
    output branch,
    output [5:0] imm
);

    // Decoder outputs
    wire [3:0] opcode;
    wire [2:0] rs1;
    wire [2:0] rs2;
   wire [2:0] rd_r;
    wire [2:0] rd_i;
    wire [2:0] rd_sel;

    // Control signals
    wire [2:0] alu_control;
    wire regwrite;
    wire alu_src;
    wire wb_sel;
    wire rd_src;
    wire mem_read;
    wire mem_write;
    wire mem_to_reg;

    // Register file outputs
    wire [7:0] read1;
    wire [7:0] read2;

    // Immediate extension
    wire [7:0] imm_ext;

    // ALU input selection
    wire [7:0] alu_b;
    wire [7:0] write_data;
    wire [7:0] mem_read_data;
        //-----------------------------------
    // Decoder
    //-----------------------------------
    decoder dec_inst(
        .instruction(instruction),
        .opcode(opcode),
        .rs1(rs1),
        .rs2(rs2),
       .rd_r(rd_r),
        .rd_i(rd_i),
        .imm(imm)
    );

    //-----------------------------------
    // Control Unit
    //-----------------------------------
    control_unit cu_inst(
        .opcode(opcode),
        .alu_control(alu_control),
        .regwrite(regwrite),
        .alu_src(alu_src),
        .wb_sel(wb_sel),
        .branch(branch),
        .rd_src(rd_src),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg)
    );
assign rd_sel = (rd_src) ? rd_i : rd_r;
    //-----------------------------------
    // Register File
    //-----------------------------------
    register_file rf_inst(
        .clk(clk),
        .rst(rst),
        .regwrite(regwrite),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd_sel),
        .writedata(write_data),
        .read1(read1),
        .read2(read2)
    );

    //-----------------------------------
    // Immediate Extension
    //-----------------------------------
    assign imm_ext = {2'b00, imm};

    //-----------------------------------
    // ALU Source MUX
    //-----------------------------------
    assign alu_b = (alu_src) ? imm_ext : read2;

    //-----------------------------------
    // Writeback MUX
    //-----------------------------------
    assign write_data =
    (mem_to_reg) ? mem_read_data :
    (wb_sel)     ? imm_ext :
                   alu_result;
    //-----------------------------------
    // ALU
    //-----------------------------------
    alu alu_inst(
        .a(read1),
        .b(alu_b),
        .alu_control(alu_control),
        .result(alu_result),
        .zero(zero)
    );
    data_memory dmem_inst(
    .clk(clk),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .address(alu_result),
    .write_data(read2),
    .read_data(mem_read_data)
);

endmodule