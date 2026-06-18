module cpu(
    input clk,
    input rst
);

    wire [7:0] pc_out;
    wire [7:0] next_pc;
    wire [15:0] instruction;
    wire [7:0] alu_result;

    // New BEQ signals
    wire zero;
    wire branch;
    wire [5:0] imm;

    // New PC logic
    wire [7:0] pc_plus_1;
    wire [7:0] branch_target;

    assign pc_plus_1    = pc_out + 8'd1;
    assign branch_target = pc_out + imm;

    assign next_pc =
        (branch && zero) ?
            branch_target :
            pc_plus_1;

    //-----------------------------------
    // Program Counter
    //-----------------------------------
    pc pc_inst(
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc_out)
    );

    //-----------------------------------
    // Instruction Memory
    //-----------------------------------
    instruc_mem imem_inst(
        .address(pc_out),
        .instruction(instruction)
    );

    //-----------------------------------
    // Execute Unit
    //-----------------------------------
    execute_unit exe_inst(
        .clk(clk),
        .rst(rst),
        .instruction(instruction),
        .alu_result(alu_result),
        .zero(zero),
        .branch(branch),
        .imm(imm)
    );

endmodule