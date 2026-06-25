`timescale 1ns / 1ps

module cpu(
    input clk,
    input rst,

    output [7:0] alu_out,
    output [7:0] pc_debug,
    output zero_debug,
    output branch_debug,

    output [7:0] imm_debug,
    output [7:0] mem_debug,

    output [1:0] workload_mode_debug,

    output alu_enable_debug,
    output mem_enable_debug,

    output alu_clk_debug,
    output mem_clk_debug
);

    //-------------------------------------------------
    // Internal Signals
    //-------------------------------------------------

    wire [7:0] pc_out;
    wire [7:0] next_pc;

    wire [15:0] instruction;

    wire [7:0] alu_result;

    wire zero;
    wire branch;

    wire [5:0] imm;

    wire [7:0] pc_plus_1;
    wire [7:0] branch_target;

    //-------------------------------------------------
    // Debug Signals
    //-------------------------------------------------

    wire [7:0] imm_dbg_wire;
    wire [7:0] mem_dbg_wire;

    //-------------------------------------------------
    // Workload Monitoring
    //-------------------------------------------------

    wire [3:0] opcode;

    wire [7:0] alu_count;
    wire [7:0] mem_count;
    wire [7:0] branch_count;

    wire [1:0] workload_mode;

    //-------------------------------------------------
    // Clock Gating
    //-------------------------------------------------

    wire alu_enable;
    wire mem_enable;

    wire alu_clk;
    wire mem_clk;

    //-------------------------------------------------
    // Next PC Logic
    //-------------------------------------------------

    assign pc_plus_1 = pc_out + 8'd1;

   wire [7:0] imm_branch;

assign imm_branch = {2'b00,imm};

assign branch_target = pc_out + imm_branch;

    assign next_pc =
        (branch && zero) ?
        branch_target :
        pc_plus_1;

    //-------------------------------------------------
    // Program Counter
    //-------------------------------------------------

    pc pc_inst(
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc_out)
    );

    //-------------------------------------------------
    // Instruction Memory
    //-------------------------------------------------

    instruc_mem imem_inst(
        .address(pc_out),
        .instruction(instruction)
    );

    //-------------------------------------------------
    // Execute Unit
    //-------------------------------------------------

    exceute exe_inst(

        .clk(clk),
        .rst(rst),

        .instruction(instruction),

        .alu_result(alu_result),

        .zero(zero),
        .branch(branch),

        .imm(imm),

        .opcode_debug(opcode),

        .mem_debug(mem_dbg_wire),
        .imm_debug(imm_dbg_wire)

    );

    //-------------------------------------------------
    // Workload Monitor
    //-------------------------------------------------

    workload WM(

        .clk(clk),
        .rst(rst),

        .opcode(opcode),

        .alu_count(alu_count),
        .mem_count(mem_count),
        .branch_count(branch_count),

        .workload_mode(workload_mode)

    );

    //-------------------------------------------------
    // Clock Gating Controller
    //-------------------------------------------------

    clock_gating_controller CG(

        .workload_mode(workload_mode),

        .alu_enable(alu_enable),
        .mem_enable(mem_enable)

    );

    //-------------------------------------------------
    // ALU Clock Gate
    //-------------------------------------------------

    clock_gate ALU_GATE(

        .clk(clk),

        .enable(alu_enable),

        .gated_clk(alu_clk)

    );

    //-------------------------------------------------
    // Memory Clock Gate
    //-------------------------------------------------

    clock_gate MEM_GATE(

        .clk(clk),

        .enable(mem_enable),

        .gated_clk(mem_clk)

    );

    //-------------------------------------------------
    // Debug Outputs
    //-------------------------------------------------

    assign alu_out = alu_result;

    assign pc_debug = pc_out;

    assign zero_debug = zero;

    assign branch_debug = branch;

    assign imm_debug = imm_dbg_wire;

    assign mem_debug = mem_dbg_wire;

    assign workload_mode_debug = workload_mode;

    assign alu_enable_debug = alu_enable;

    assign mem_enable_debug = mem_enable;

    assign alu_clk_debug = alu_clk;

    assign mem_clk_debug = mem_clk;

endmodule