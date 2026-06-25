module decoder(
    input [15:0] instruction,

    output [3:0] opcode,
    output [2:0] rs1,
    output [2:0] rs2,
    output [2:0] rd_r,
    output [2:0] rd_i,
    output [5:0] imm
);

assign opcode = instruction[15:12]; // Opcode

assign rs1 = instruction[11:9];     // Source Register 1
assign rs2 = instruction[8:6];      // Source Register 2

assign rd_r = instruction[5:3];     // R-type destination
assign rd_i = instruction[8:6];     // I-type destination

assign imm = instruction[5:0];      // Immediate

endmodule